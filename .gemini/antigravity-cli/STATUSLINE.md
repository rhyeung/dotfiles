# Antigravity CLI Custom Statusline

A highly-optimised, custom status line script designed for the Antigravity CLI (`agy`) to provide real-time agent status, context window utilisation, live quota tracking, and repository branch details.

---

## Key Features

### 1. Portable Hybrid Quota Fallback
The status line intelligently monitors your remaining 5-hour and weekly quotas, ensuring the display never freezes or disappears:
* **Piped Mode (Primary):** Prioritises the fast, inline `"quota"` block provided directly by the CLI on every turn. This has zero performance overhead and requires no extra network calls.
* **Background Cache (Fallback):** If the CLI's internal quota loop is throttled, fails due to network sleep-wake cycles, or goes stale when the terminal is idle, the script automatically falls back to an independent cache.
* **Environment Detection:** The script automatically checks if the external npm package `antigravity-usage` is installed. If available, it sets up the hybrid background cache; if not, it gracefully degrades to pure piped mode without throwing errors.

### 2. Streaming-Aware Token Accumulator
Unlike simple counters that suffer from double-counting, this script separates token counting phases to ensure 100% accuracy:
* **Turn/Step Accumulation:** Detects when a new prompt or tool step is executed (when `total_input_tokens` changes) and accumulates the cache-read tokens exactly once.
* **Streaming Updates:** During response generation (when only `total_output_tokens` changes), the script updates the display in real time without double-counting the cache-read tokens.

### 3. Compact Layout & Subscription Badging
Renders a single-line status bar packed with essential metrics:
* **State Indicator:** Shows the active agent state (`READY`, `THINKING`, `WORKING`, `TOOL`).
* **Context Utilisation:** Highlights the percentage of the context window used, with dynamic colour warnings if usage exceeds 80%.
* **Token Stats:** Displays current turn and session totals for input, output, and cache-read tokens: `[📥cur_in/total_in 📤cur_out/total_out ⚡cur_cache/total_cache]`.
* **VCS Integration:** Automatically displays the active Git branch and flags dirty workspaces with an asterisk (`*`).
* **Subscription & Sandbox Badges:** Shows the active subscription plan tier and whether the sandbox environment is enabled.

---

## File Structure

The status line and its supporting files are located in `~/.gemini/antigravity-cli/`:

* **[statusline.py](file:///Users/ray/.gemini/antigravity-cli/statusline.py):** The main Python execution script.
* **[settings.json](file:///Users/ray/.gemini/antigravity-cli/settings.json):** The CLI configuration file linking the status line.
* **[scratch/session_cache.json](file:///Users/ray/.gemini/antigravity-cli/scratch/session_cache.json):** Persists session token counts to prevent double-counting across turns.
* **[scratch/quota_cache.json](file:///Users/ray/.gemini/antigravity-cli/scratch/quota_cache.json):** Local cache containing General and 3P model quotas, updated asynchronously in the background.

---

## Integration Setup

The status line is integrated directly with the Antigravity CLI via `~/.gemini/antigravity-cli/settings.json`. Ensure the following block is present:

```json
  "statusLine": {
    "type": "command",
    "command": "/Users/ray/.gemini/antigravity-cli/statusline.py",
    "enabled": true,
    "stack_with_default": true
  }
```

---

## Fallback Dependencies

To enable the robust hybrid fallback and background token refresh, ensure the external utility is installed:

```bash
# Check if the utility is globally available
antigravity-usage --version
```

If missing, the script will automatically bypass the cache and run in pure piped mode (#1) with no degradation in core performance.
