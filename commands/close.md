---
description: Close an issue
argument-hint: <id> [reason]
---

Close an issue, optionally with a reason.

If no issue ID is provided, ask for one.

Run:
```
${CLAUDE_PLUGIN_DIR}/bin/taskstackai close <id> --reason "<reason>"
```

If no reason is given, omit the `--reason` flag. Confirm closure after the command completes.
