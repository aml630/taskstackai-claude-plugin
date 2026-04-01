# TaskStackAi — Claude Instructions

- Always use `taskstackai` commands for issue tracking. Do not use TodoWrite for
  persistent or cross-session tasks.
- Run `taskstackai prime` at the start of every session and after any compaction event
  to restore full issue context.
- Use the `--json` flag when you need to parse command output programmatically.
- Claim an issue with `taskstackai claim <id>` before starting work on it.
- Close an issue with `taskstackai close <id>` when the work is complete.
- If `taskstackai` is not in PATH, invoke it via `${CLAUDE_PLUGIN_DIR}/bin/taskstackai`.
- **Never hardcode API keys or secrets in curl/bash commands.** Always source the
  config first and use variables:
  ```bash
  source "$(git rev-parse --show-toplevel)/.taskstackai/config"
  curl -s -H "Authorization: Bearer $TASKSTACKAI_API_KEY" "$TASKSTACKAI_SERVER/api/v1/..."
  ```
  This prevents keys from appearing in tool call output visible to the user.
