---
description: Comment operations on issues
argument-hint: <add|list|edit|delete> <args>
---

Manage comments on issues. Parse the user's subcommand and arguments.

Subcommands:

- **add**: Add a comment. `taskstackai comment add <issue-id> "<text>"`
- **list**: List comments on an issue. `taskstackai comment list <issue-id>`
- **edit**: Edit a comment. `taskstackai comment edit <comment-id> "<text>"`
- **delete**: Delete a comment. `taskstackai comment delete <comment-id>`

If the subcommand or required arguments are missing, ask the user.
