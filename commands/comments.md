---
description: Comment operations on issues
argument-hint: <add|list|edit|delete> <args>
---

Manage comments on issues. Parse the user's subcommand and arguments.

Subcommands:

- **add**: Add a comment. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai comment add <issue-id> "<text>"`
- **list**: List comments on an issue. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai comment list <issue-id>`
- **edit**: Edit a comment. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai comment edit <comment-id> "<text>"`
- **delete**: Delete a comment. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai comment delete <comment-id>`

If the subcommand or required arguments are missing, ask the user.
