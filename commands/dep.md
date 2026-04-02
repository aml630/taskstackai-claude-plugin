---
description: Manage issue dependencies
argument-hint: <add|rm|blocks|blocked-by> <args>
---

Manage dependencies between issues. Parse the user's subcommand and arguments.

Subcommands:

- **add**: Add a dependency. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai dep add <issue-id> <depends-on-id>`
- **rm**: Remove a dependency. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai dep rm <issue-id> <depends-on-id>`
- **blocks**: Show what a given issue blocks. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai dep blocks <issue-id>`
- **blocked-by**: Show what blocks a given issue. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai dep blocked-by <issue-id>`

If the subcommand or required IDs are missing, ask the user. After modifying dependencies, confirm the change.
