---
description: View event audit trail
argument-hint: [issue <id>]
---

View the audit trail of events. Can show all events or events for a specific issue.

- List all recent events: `${CLAUDE_PLUGIN_DIR}/bin/taskstackai event list`
- Show events for a specific issue: `${CLAUDE_PLUGIN_DIR}/bin/taskstackai event issue <id>`

If the user specifies an issue ID, use the issue-specific command. Otherwise, list all recent events. Present the timeline clearly with timestamps and event descriptions.
