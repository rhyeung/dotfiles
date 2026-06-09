#!/usr/bin/env python3
import sys
import json
import os
import time
import datetime
import subprocess

def format_reset_time(ms):
    if ms is None:
        return ""
    seconds = int(ms / 1000)
    if seconds <= 0:
        return "now"
    hours = seconds // 3600
    minutes = (seconds % 3600) // 60
    if hours > 0:
        return f"{hours}h {minutes}m"
    return f"{minutes}m"

def get_quota_info(model_label):
    if not model_label:
        return None, None, None
        
    cache_path = "/Users/ray/.gemini/antigravity-cli/scratch/quota_cache.json"
    now = time.time()
    
    # Try reading cache
    cache_data = None
    if os.path.exists(cache_path):
        try:
            with open(cache_path, "r") as f:
                cache_data = json.load(f)
        except Exception:
            pass
            
    # Check if cache is expired (5 minutes)
    is_expired = True
    if cache_data and "timestamp" in cache_data:
        if now - cache_data["timestamp"] < 300: # 5 minutes
            is_expired = False
            
    if is_expired:
        try:
            # Run the command asynchronously to update the cache file in the background
            update_script = (
                f"antigravity-usage quota --json > {cache_path}.tmp && "
                f"python3 -c 'import json, time; d=json.load(open(\"{cache_path}.tmp\")); d[\"timestamp\"]=time.time(); json.dump(d, open(\"{cache_path}\", \"w\"))' && "
                f"rm -f {cache_path}.tmp"
            )
            subprocess.Popen(update_script, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        except Exception:
            pass

    # Use existing cache data if available
    if cache_data and "models" in cache_data:
        target = model_label.lower().strip()
        normalized_target = target.replace("gemini ", "").replace(" (medium)", "").replace(" (high)", "").replace(" (low)", "").strip()
        
        best_match = None
        for m in cache_data["models"]:
            m_label = m.get("label", "").lower().strip()
            m_id = m.get("modelId", "").lower().strip()
            
            # Exact matches
            if target == m_label or target == m_id:
                return m.get("remainingPercentage"), m.get("timeUntilResetMs"), m.get("resetTime")
                
            # Secondary heuristic matches
            if normalized_target and (normalized_target in m_label or normalized_target in m_id):
                best_match = m
                
        if best_match:
            return best_match.get("remainingPercentage"), best_match.get("timeUntilResetMs"), best_match.get("resetTime")
                
    return None, None, None

def main():
    try:
        # Read JSON from stdin
        raw_input = sys.stdin.read()
        
        # Write payload to scratch for debugging/reference
        try:
            scratch_dir = "/Users/ray/.gemini/antigravity-cli/scratch"
            os.makedirs(scratch_dir, exist_ok=True)
            with open(os.path.join(scratch_dir, "status_payload.json"), "w") as f:
                f.write(raw_input)
        except Exception:
            pass

        data = json.loads(raw_input)
    except Exception:
        # Fallback if stdin is empty or invalid JSON
        print("\033[1;36m🤖 Antigravity\033[0m | Ready")
        return

    # ANSI Colors
    RESET = "\033[0m"
    BOLD = "\033[1m"
    CYAN = "\033[36m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    RED = "\033[31m"
    MAGENTA = "\033[35m"
    BLUE = "\033[34m"
    WHITE = "\033[37m"

    parts = []

    # Model details
    model = data.get("model") or {}
    raw_model_name = model.get("display_name") or model.get("id") or ""
    model_name = raw_model_name.replace("Gemini ", "").replace(" (Medium)", "").replace(" (Large)", "")
    if not model_name:
        model_name = "Gemini"
    parts.append(f"🧠 Model: {BOLD}{GREEN}{model_name}{RESET}")

    # Fetch quota info for current model
    rem, ms, reset_time = None, None, None
    if raw_model_name:
        try:
            rem, ms, reset_time = get_quota_info(raw_model_name)
        except Exception:
            pass

    # Workspace directory
    cwd = data.get("cwd", "")
    if cwd:
        folder_name = os.path.basename(cwd)
        parts.append(f"📁 {BOLD}{WHITE}{folder_name}{RESET}")

    # Git branch information
    vcs = data.get("vcs", {})
    if vcs and vcs.get("branch"):
        branch = vcs.get("branch")
        dirty = "*" if vcs.get("dirty") else ""
        dirty_color = RED if dirty else RESET
        parts.append(f" {MAGENTA}{branch}{dirty_color}{dirty}{RESET}")

    # Context and tokens
    context = data.get("context_window", {})
    if context:
        used_pct = context.get("used_percentage")
        tokens = context.get("total_input_tokens")
        if used_pct is not None:
            pct = int(used_pct)
            if pct <= 50:
                color = GREEN
            elif pct <= 80:
                color = YELLOW
            else:
                color = RED
            
            token_str = ""
            if tokens is not None:
                tokens = int(tokens)
                if tokens >= 1_000_000:
                    token_str = f" ({tokens/1_000_000:.1f}M tkn)"
                elif tokens >= 1_000:
                    token_str = f" ({tokens/1_000:.0f}k tkn)"
                else:
                    token_str = f" ({tokens} tkn)"
                    
            parts.append(f"Context: {BOLD}{color}{pct}%{RESET}{token_str}")

    # Active tasks and subagents
    tasks = data.get("task_count")
    if tasks:
        parts.append(f"⚙️ Tasks: {BOLD}{YELLOW}{tasks}{RESET}")

    # Artifacts count
    artifacts = data.get("artifact_count")
    if artifacts:
        parts.append(f"📄 Docs: {BOLD}{BLUE}{artifacts}{RESET}")

    # Requests count
    conversation_id = data.get("conversation_id")
    if conversation_id:
        try:
            transcript_path = f"/Users/ray/.gemini/antigravity-cli/brain/{conversation_id}/.system_generated/logs/transcript.jsonl"
            req_count = 0
            
            # Filter requests in the current conversation to only those in the current quota period
            quota_start_dt = None
            if reset_time:
                try:
                    reset_dt = datetime.datetime.fromisoformat(reset_time.replace('Z', '+00:00'))
                    quota_start_dt = reset_dt - datetime.timedelta(hours=5)
                except Exception:
                    pass

            if os.path.exists(transcript_path):
                with open(transcript_path, "r", encoding="utf-8") as f:
                    for line in f:
                        if '"type":"PLANNER_RESPONSE"' in line:
                            try:
                                step = json.loads(line)
                                if step.get("type") == "PLANNER_RESPONSE":
                                    if quota_start_dt:
                                        created_at = step.get("created_at")
                                        if created_at:
                                            req_dt = datetime.datetime.fromisoformat(created_at.replace('Z', '+00:00'))
                                            if req_dt >= quota_start_dt:
                                                req_count += 1
                                        else:
                                            req_count += 1
                                    else:
                                        req_count += 1
                            except Exception:
                                req_count += 1
            
            today_reqs = 0
            today_date = datetime.date.today()
            brain_dir = "/Users/ray/.gemini/antigravity-cli/brain"
            if os.path.exists(brain_dir):
                for conv_dir in os.listdir(brain_dir):
                    t_path = os.path.join(brain_dir, conv_dir, ".system_generated/logs/transcript.jsonl")
                    if os.path.exists(t_path):
                        with open(t_path, "r", encoding="utf-8") as f:
                            for line in f:
                                if '"type":"PLANNER_RESPONSE"' in line:
                                    idx = line.find('"created_at":"')
                                    if idx != -1:
                                        # Extract ISO timestamp e.g. 2026-06-08T14:06:52Z
                                        iso_str = line[idx+14 : idx+34]
                                        try:
                                            dt_utc = datetime.datetime.fromisoformat(iso_str.replace('Z', '+00:00'))
                                            dt_local = dt_utc.astimezone()
                                            if dt_local.date() == today_date:
                                                today_reqs += 1
                                        except Exception:
                                            pass

            if req_count > 0:
                if today_reqs > 0:
                    parts.append(f"💬 Reqs: {BOLD}{YELLOW}{req_count}{RESET}/{today_reqs}")
                else:
                    parts.append(f"💬 Reqs: {BOLD}{YELLOW}{req_count}{RESET}")
        except Exception:
            pass

    # Quota and rolling reset information
    if rem is not None:
        try:
            used_pct = int((1 - rem) * 100)
            time_str = format_reset_time(ms)
            
            # Dynamic coloring based on used percentage
            if used_pct <= 50:
                quota_color = GREEN
            elif used_pct <= 80:
                quota_color = YELLOW
            else:
                quota_color = RED
            
            reset_info = f" ({time_str})" if time_str else ""
            parts.append(f"⏳ 5h Limit: {BOLD}{quota_color}{used_pct}%{RESET}{reset_info}")
        except Exception:
            pass

    # Notifications/Updates
    notifications = data.get("notifications")
    if notifications:
        note_parts = []
        for note in notifications:
            if isinstance(note, dict):
                msg = note.get("message") or note.get("content") or note.get("text")
                if not msg:
                    msg = str(note)
                
                priority = note.get("priority", "").upper()
                if "HIGH" in priority:
                    msg = f"{RED}{msg}{RESET}"
                elif "WARNING" in priority or "MEDIUM" in priority:
                    msg = f"{YELLOW}{msg}{RESET}"
                else:
                    msg = f"{CYAN}{msg}{RESET}"
                
                note_parts.append(msg)
            else:
                note_parts.append(f"{CYAN}{str(note)}{RESET}")
        
        if note_parts:
            parts.append(f"🔔 {', '.join(note_parts)}")

    # Agent execution state
    state = data.get("agent_state") or data.get("status")
    if state:
        state_color = GREEN if state.lower() == "idle" else CYAN
        parts.append(f"[{state_color}{state.upper()}{RESET}]")

    # Join status bar with separator
    separator = f" {RESET}| "
    output = separator.join(parts)
    print(output)

if __name__ == "__main__":
    main()
