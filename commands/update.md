---
description: Update an existing issue
argument-hint: <id> [field=value]
---

Update fields on an existing issue.

If no issue ID is provided, ask for one. Parse the user's field=value pairs and map them to CLI flags.

Supported flags: `--title`, `--type`, `--priority`, `--status`, `--description`, `--assignee`

Run:
```
taskstackai update <id> --<field> <value> [--<field2> <value2> ...]
```

Confirm the update after it completes by showing what changed.
