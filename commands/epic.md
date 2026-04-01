---
description: Epic operations
argument-hint: <list|tree|subtask> <args>
---

Manage epics and their subtasks. Parse the user's subcommand and arguments.

Subcommands:

- **list**: List all epics. `taskstackai epic list`
- **tree**: Show epic tree with subtasks. `taskstackai epic tree <epic-id>`
- **subtask**: Add a subtask to an epic. `taskstackai epic subtask <epic-id> <issue-id>`

If the subcommand or required IDs are missing, ask the user. Present tree output in a readable hierarchical format.
