---
description: Create a new issue in TaskStackAi
argument-hint: [title] [type] [priority]
---

Create a new issue using the `taskstackai` CLI.

If the user provides title, type, and priority, run the command directly. If any are missing, ask for them before proceeding.

Valid types: task, bug, feature, epic
Priority is 1 (highest) through 4 (lowest). Default to 2 if not specified.

Run:
```
taskstackai create --title "<title>" --type <type> --priority <priority> --json
```

If the user provided a description, add `--description "<description>"`.

After creation, display the new issue ID and a brief summary of what was created.
