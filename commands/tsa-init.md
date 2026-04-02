---
description: Initialize TaskStackAi for this project
argument-hint: [--key <key>]
---

Guide the user through initializing TaskStackAi for their project.

1. Ask for the API key if not provided (they can get one at https://taskstackai.com/api-keys).
2. Run:
```
taskstackai init --key <key>
```
3. Confirm successful initialization.
4. Verify that `AGENTS.md` was created in the repo root (the setup command creates it automatically). If it already existed, let the user know it was preserved.

The setup creates:
- `.taskstackai/config` — API key config (gitignored)
- `AGENTS.md` — Instructions for AI agents to use TaskStackAi for issue tracking (should be committed)

If the user doesn't have a key, explain they need a TaskStackAi account at https://taskstackai.com and should create a project and generate an API key before proceeding.
