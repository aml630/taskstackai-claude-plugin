---
description: Label operations
argument-hint: <list|create|add|rm|delete> <args>
---

Manage labels on issues. Parse the user's subcommand and arguments.

Subcommands:

- **list**: List all labels. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai label list`
- **create**: Create a new label. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai label create "<name>"`
- **add**: Add a label to an issue. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai label add <issue-id> "<label>"`
- **rm**: Remove a label from an issue. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai label rm <issue-id> "<label>"`
- **delete**: Delete a label entirely. `${CLAUDE_PLUGIN_DIR}/bin/taskstackai label delete "<name>"`

If the subcommand or required arguments are missing, ask the user.
