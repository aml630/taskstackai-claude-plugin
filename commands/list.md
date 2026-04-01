---
description: List and filter issues
argument-hint: [--status open] [--type task]
---

List issues with optional filters.

Build the command from the user's arguments. Supported filters include `--status`, `--type`, `--priority`, `--assignee`, and `--label`.

Run:
```
taskstackai list [filters...]
```

If no filters are given, run `taskstackai list` to show all open issues. Present results in a readable table or list format.
