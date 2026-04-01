---
description: Manage issue dependencies
argument-hint: <add|rm|blocks|blocked-by> <args>
---

Manage dependencies between issues. Parse the user's subcommand and arguments.

Subcommands:

- **add**: Add a dependency. `taskstackai dep add <issue-id> <depends-on-id>`
- **rm**: Remove a dependency. `taskstackai dep rm <issue-id> <depends-on-id>`
- **blocks**: Show what a given issue blocks. `taskstackai dep blocks <issue-id>`
- **blocked-by**: Show what blocks a given issue. `taskstackai dep blocked-by <issue-id>`

If the subcommand or required IDs are missing, ask the user. After modifying dependencies, confirm the change.
