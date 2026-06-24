#!/usr/bin/env python3
import sys
import json
import os
import subprocess

# ANSI Helpers (Standard 16-colour palette only)
RESET = "\033[0m"
BOLD = "\033[1m"
MAGENTA = "\033[35m"

# Foreground accents (Standard 16 colours)
FG_GRAY = "\033[90m"
FG_RED = "\033[31m"
FG_GREEN = "\033[32m"
FG_YELLOW = "\033[33m"
FG_WHITE = "\033[37m"
FG_BRIGHT_RED = "\033[91m"
FG_BRIGHT_GREEN = "\033[92m"
FG_BRIGHT_YELLOW = "\033[93m"
FG_BRIGHT_MAGENTA = "\033[95m"
FG_BRIGHT_CYAN = "\033[96m"
FG_BRIGHT_WHITE = "\033[97m"

# Number Highlight Colour
NUM_COLOR = FG_BRIGHT_WHITE + BOLD

def get_quota_color(used_pct):
    if used_pct <= 50:
        return FG_GREEN
    if used_pct <= 75:
        return FG_YELLOW
    return FG_RED

def format_reset_time(seconds, detailed=True):
    if seconds is None:
        return ""
    if seconds <= 0:
        return "now"

    days = seconds // 86400
    if days >= 1:
        return f"{days}d"

    hours = seconds // 3600
    minutes = (seconds % 3600) // 60

    if hours > 0:
        if detailed:
            return f"{hours}h {minutes}m"
        return f"{hours}h"

    if minutes <= 0:
        return "now"
    return f"{minutes}m"

def get_session_cache(conversation_id, total_in, total_out, msg_cache):
    if not conversation_id:
        return msg_cache

    cache_path = "/Users/ray/.gemini/antigravity-cli/scratch/session_cache.json"
    data = {}
    if os.path.exists(cache_path):
        try:
            with open(cache_path, "r") as f:
                data = json.load(f)
        except Exception:
            pass

    entry = data.get(conversation_id) or {
        "last_total_input_tokens": 0,
        "last_total_output_tokens": 0,
        "accumulated_cache_read_tokens": 0
    }

    # Check if this is a new API call (input tokens changed) or just streaming (only output tokens changed)
    input_changed = total_in != entry["last_total_input_tokens"]
    is_new_session = entry["last_total_input_tokens"] == 0 and entry["last_total_output_tokens"] == 0

    if input_changed or is_new_session:
        # New turn or new tool step: accumulate the cache read tokens
        entry["accumulated_cache_read_tokens"] += msg_cache
        entry["last_total_input_tokens"] = total_in
        entry["last_total_output_tokens"] = total_out
        data[conversation_id] = entry
        try:
            with open(cache_path, "w") as f:
                json.dump(data, f)
        except Exception:
            pass
    elif total_out != entry["last_total_output_tokens"]:
        # Streaming update: just update the output token count without accumulating cache again
        entry["last_total_output_tokens"] = total_out
        data[conversation_id] = entry
        try:
            with open(cache_path, "w") as f:
                json.dump(data, f)
        except Exception:
            pass

    return entry["accumulated_cache_read_tokens"]

def main():
    try:
        # Read JSON from stdin
        raw_input = sys.stdin.read()
        data = json.loads(raw_input)
    except Exception:
        # Fallback if stdin is empty or invalid JSON
        print("\033[1;36m🤖 Antigravity\033[0m · Ready")
        return

    # Parse fields
    state = data.get("agent_state") or data.get("status") or "idle"
    context = data.get("context_window") or {}
    used_pct = context.get("used_percentage") or 0.0

    total_in = context.get("total_input_tokens") or 0
    total_out = context.get("total_output_tokens") or 0

    cwd = data.get("cwd", "")
    conversation_id = data.get("conversation_id", "")
    vcs = data.get("vcs") or {}
    vcs_branch = vcs.get("branch") or ""
    vcs_dirty = vcs.get("dirty") or False

    # Git branch information fallback
    if vcs and vcs.get("type") == "git" and not vcs_branch and cwd:
        try:
            proc = subprocess.run(
                ["git", "-C", cwd, "status", "--porcelain", "-b"],
                capture_output=True,
                text=True,
                check=True
            )
            lines = proc.stdout.splitlines()
            if lines:
                first_line = lines[0]
                if first_line.startswith("## "):
                    branch_part = first_line[3:].strip()
                    if "..." in branch_part:
                        vcs_branch = branch_part.split("...")[0]
                    else:
                        vcs_branch = branch_part.split()[0] if branch_part else "HEAD"
                vcs_dirty = len(lines) > 1
        except Exception:
            pass

    sandbox_info = data.get("sandbox") or {}
    sandbox_enabled = sandbox_info.get("enabled") or False

    artifacts = data.get("artifact_count") or 0

    subagents_list = data.get("subagents")
    subagents = len(subagents_list) if isinstance(subagents_list, list) else 0

    bg_tasks = data.get("background_tasks")
    task_count = len(bg_tasks) if isinstance(bg_tasks, list) else (data.get("task_count") or 0)

    model = data.get("model") or {}
    raw_model_name = model.get("display_name") or model.get("id") or ""

    # Fetch quota info for current model
    rem, reset_seconds = None, None
    weekly_rem = None
    weekly_reset_seconds = None

    # Try to get quota from the stdin payload
    quota_data = data.get("quota") or {}

    # Check if the external npm tool is available for the hybrid fallback
    import shutil
    has_external_cli = shutil.which("antigravity-usage") is not None

    if has_external_cli:
        # Asynchronously maintain an independent background cache as a robust fallback
        cache_path = "/Users/ray/.gemini/antigravity-cli/scratch/quota_cache.json"
        import time
        now = time.time()
        cache_data = None
        if os.path.exists(cache_path):
            try:
                with open(cache_path, "r") as f:
                    cache_data = json.load(f)
            except Exception:
                pass

        # Refresh the background cache if it is older than 5 minutes
        is_expired = True
        if cache_data and "timestamp" in cache_data:
            if now - cache_data["timestamp"] < 300:
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

        # If stdin quota is missing or stale, fall back to the background cache
        if not quota_data and cache_data and "models" in cache_data:
            quota_data = {}
            for m in cache_data.get("models", []):
                m_id = m.get("modelId", "").lower()
                m_label = m.get("label", "").lower()

                # Check if this model matches our active model
                model_match = False
                if raw_model_name:
                    target = raw_model_name.lower().strip()
                    normalized_target = target.replace("gemini ", "").replace(" (medium)", "").replace(" (high)", "").replace(" (low)", "").strip()
                    if target == m_id or target == m_label:
                        model_match = True
                    elif normalized_target and (normalized_target in m_id or normalized_target in m_label):
                        model_match = True

                if model_match:
                    # Map the flat cache structure to the nested structure expected by the status line
                    model_is_gemini = "gemini" in raw_model_name.lower() or "google" in raw_model_name.lower()
                    key_5h = "gemini-5h" if model_is_gemini else "3p-5h"

                    # Note: The background utility only returns a single 5h quota, so we map it to key_5h
                    quota_data[key_5h] = {
                        "remaining_fraction": m.get("remainingPercentage"),
                        "reset_in_seconds": int(m.get("timeUntilResetMs", 0) / 1000)
                    }
                    break

    # Parse the resolved quota data
    if quota_data:
        try:
            model_is_gemini = "gemini" in raw_model_name.lower() or "google" in raw_model_name.lower()
            key_5h = "gemini-5h" if model_is_gemini else "3p-5h"
            key_weekly = "gemini-weekly" if model_is_gemini else "3p-weekly"

            q_5h = quota_data.get(key_5h)
            if q_5h:
                rem = q_5h.get("remaining_fraction")
                reset_seconds = q_5h.get("reset_in_seconds")

            q_weekly = quota_data.get(key_weekly)
            if q_weekly:
                weekly_rem = q_weekly.get("remaining_fraction")
                weekly_reset_seconds = q_weekly.get("reset_in_seconds")
        except Exception:
            pass

    quota_str = ""
    if rem is not None:
        try:
            quota_used_pct = int(round((1 - rem) * 100))
            time_str = format_reset_time(reset_seconds, detailed=True)
            quota_color = get_quota_color(quota_used_pct)

            reset_info = f" ({time_str})" if time_str else ""
            quota_str = f"{FG_GRAY}⏳ 5h {quota_color}{BOLD}{quota_used_pct}%{RESET}{reset_info}"

            if weekly_rem is not None:
                weekly_used_pct = int(round((1 - weekly_rem) * 100))
                weekly_color = get_quota_color(weekly_used_pct)

                bar_len = 15
                filled_len = int(round(weekly_used_pct * bar_len / 100))
                filled_len = max(0, min(bar_len, filled_len))
                weekly_bar = "█" * filled_len + "░" * (bar_len - filled_len)

                reset_info_weekly = ""
                if weekly_reset_seconds is not None:
                    time_str_weekly = format_reset_time(weekly_reset_seconds, detailed=False)
                    reset_info_weekly = f" ({time_str_weekly})" if time_str_weekly else ""

                quota_str += f" {FG_GRAY}Wk {weekly_color}[{weekly_bar}] {BOLD}{weekly_color}{weekly_used_pct}%{RESET}{reset_info_weekly}"
        except Exception:
            pass

    # Computed Values
    pct_fmt = f"{used_pct:.1f}"
    pct_int = int(used_pct)

    # State Indicator (No background colours)
    s_lower = state.lower()
    if s_lower == "idle":
        s = f"{FG_BRIGHT_GREEN}{BOLD}● READY{RESET}"
    elif s_lower == "thinking":
        s = f"{FG_BRIGHT_YELLOW}{BOLD}◆ THINKING{RESET}"
    elif s_lower == "working":
        s = f"{FG_BRIGHT_CYAN}{BOLD}⚙ WORKING{RESET}"
    elif s_lower == "tool_use":
        s = f"{FG_BRIGHT_MAGENTA}{BOLD}🔧 TOOL{RESET}"
    else:
        s = f"{FG_BRIGHT_WHITE}{BOLD}⏳ {state.upper()}{RESET}"

    # Workspace Folder Name
    folder_str = ""
    if cwd:
        folder_name = os.path.basename(cwd)
        folder_str = f"📁 {BOLD}{FG_WHITE}{folder_name}{RESET}"

    # VCS Branch
    v = ""
    if vcs_branch:
        dirty_str = "*" if vcs_dirty else ""
        dirty_color = FG_RED if dirty_str else RESET
        v = f" {MAGENTA}{vcs_branch}{dirty_color}{dirty_str}{RESET}"

    # Sandbox Badge
    if sandbox_enabled:
        sb = f"🛡️ {BOLD}{FG_GREEN}Sandbox{RESET}"
    else:
        sb = f"🔓 {BOLD}{FG_RED}Host{RESET}"

    # Context Percentage with Card Index icon
    if pct_int >= 90:
        ctx_color = FG_BRIGHT_RED
    elif pct_int >= 60:
        ctx_color = FG_BRIGHT_YELLOW
    else:
        ctx_color = NUM_COLOR

    ctx = f"🗂️ {ctx_color}{pct_fmt}%{RESET}"

    # Context Token Usage stats
    cur_usage = context.get("current_usage") or {}
    in_t = cur_usage.get("input_tokens", 0)
    out_t = cur_usage.get("output_tokens", 0)
    cache_t = cur_usage.get("cache_read_input_tokens", 0)

    # Get accumulated cache read tokens for the session
    total_cache_t = get_session_cache(conversation_id, total_in, total_out, cache_t)

    def fmt_num(n):
        if n >= 1000:
            val = n / 1000
            return f"{int(val)}k" if val.is_integer() else f"{val:.1f}k"
        return str(n)

    usage_str = f"[📥{fmt_num(in_t)}/{fmt_num(total_in)} 📤{fmt_num(out_t)}/{fmt_num(total_out)} ⚡{fmt_num(cache_t)}/{fmt_num(total_cache_t)}]"

    # Stats
    art_fmt = f"{FG_GRAY}artifacts {NUM_COLOR}{artifacts}{RESET}"
    sub_fmt = f"{FG_GRAY}subagents {NUM_COLOR}{subagents}{RESET}"
    bg_fmt = f"{FG_GRAY}tasks {NUM_COLOR}{task_count}{RESET}"

    # Pending Input Count (Queue)
    pending_inputs = data.get("pending_input_count", 0)
    queue_str = ""
    if pending_inputs > 0:
        queue_str = f"📬 Queue: {BOLD}{FG_BRIGHT_YELLOW}{pending_inputs}{RESET}"

    # Separators
    dot = f"{FG_GRAY} · {RESET}"

    # Output Layout (Always single-line)
    line1 = s

    # Construct line2 items dynamically
    stats = [ctx, usage_str]
    if quota_str:
        stats.append(quota_str)
    if queue_str:
        stats.append(queue_str)
    stats.extend([art_fmt, sub_fmt, bg_fmt])
    stats.append(sb)
    if folder_str:
        stats.append(folder_str)
    line2 = dot.join(stats)
    if v:
        line2 += f"{FG_GRAY} ╱ {RESET}{v}"

    print(f"{line1}{FG_GRAY} · {RESET}{line2}")

if __name__ == "__main__":
    main()
