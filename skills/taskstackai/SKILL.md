---
name: taskstackai
description: >
  SaaS issue tracker for multi-session AI coding workflows.
  Trigger phrases: "create task", "what's ready", "track work",
  "resume after compaction"
allowed-tools:
  - Read
  - Bash(taskstackai:*)
version: 0.1.0
tags:
  - issue-tracker
  - task-management
  - ai-workflow
  - saas
  - team-collaboration
---

# TaskStackAi — SaaS Issue Tracker Skill

TaskStackAi (`taskstackai`) is a SaaS-backed issue tracker designed for multi-session AI
coding workflows. It is the cloud equivalent of the local `beads` tracker,
adding team collaboration, persistent server-side state, and API access.

---

## taskstackai vs TodoWrite

Use this decision test to choose the right tool:

| Scenario | Tool |
|---|---|
| Work spans multiple sessions, needs persistence across compactions | `taskstackai` |
| Team collaboration or shared visibility required | `taskstackai` |
| Dependency tracking between tasks | `taskstackai` |
| Quick ephemeral checklist for the current session only | `TodoWrite` |

**Rule of thumb:** if the task should survive a session restart or compaction,
use `taskstackai`. If it is throwaway scratch notes, use `TodoWrite`.

---

## Prerequisites

1. **taskstackai CLI** — available via the plugin at `${CLAUDE_PLUGIN_DIR}/bin/taskstackai`,
   or installed in PATH.
2. **Configuration** — `.taskstackai/config` must be initialized in the project root
   (run `taskstackai init` if missing).
3. **TaskStackAi server** — the remote TaskStackAi API server must be running and
   reachable (check with `taskstackai status`).

---

## CLI Reference

For the full command list run:

```
taskstackai help
```

To reload context (e.g. after compaction or at session start):

```
taskstackai prime
```

Key commands:

| Command | Purpose |
|---|---|
| `taskstackai prime` | Print a context summary for the AI — issues, statuses, next steps |
| `taskstackai ready` | List issues that are ready to work (all dependencies met) |
| `taskstackai show <id>` | Show full details for a single issue |
| `taskstackai claim <id>` | Mark an issue as in-progress / claimed by you |
| `taskstackai close <id>` | Mark an issue as done |
| `taskstackai create <title>` | Create a new issue |
| `taskstackai list` | List all issues with current statuses |
| `taskstackai status` | Show connection and project status |
| `taskstackai init` | Initialize `.taskstackai/config` for the current project |
| `taskstackai help` | Print usage information |

---

## Session Protocol

Follow this workflow each session:

1. **Discover** — `taskstackai ready` to see which issues are unblocked.
2. **Inspect** — `taskstackai show <id>` to read the full description and acceptance
   criteria.
3. **Claim** — `taskstackai claim <id>` to signal you are working on it.
4. **Work** — implement the change, commit code.
5. **Close** — `taskstackai close <id>` when the issue is complete.

After a compaction event, run `taskstackai prime` to restore context.

---

## Output Formats

### JSON mode

Append `--json` to any command to get machine-readable output:

```
taskstackai ready --json
taskstackai show 42 --json
```

Use `--json` whenever you need to parse the result programmatically.

### Status Icons

| Icon | Meaning |
|---|---|
| `[ ]` | Open / ready |
| `[>]` | In progress (claimed) |
| `[x]` | Closed / done |
| `[!]` | Blocked (unmet dependencies) |

---

## Error Handling

| Error | Likely Cause | Fix |
|---|---|---|
| `taskstackai: command not found` | CLI not in PATH | Use full path `${CLAUDE_PLUGIN_DIR}/bin/taskstackai` or run plugin setup |
| `not initialized` | Missing `.taskstackai/config` | Run `taskstackai init` in the project root |
| `connection refused` | Server unreachable | Verify the TaskStackAi server is running; check `.taskstackai/config` URL |
| `401 unauthorized` | Bad or expired token | Re-authenticate with `taskstackai login` or update token in `.taskstackai/config` |
| `404 not found` | Invalid issue ID | Double-check the ID with `taskstackai list` |
| `conflict` | Issue already claimed | Use `taskstackai show <id>` to see current assignee |

---

## Examples

### Start-of-session recovery

```
taskstackai prime
```

### Find and work on the next task

```
taskstackai ready
taskstackai show 7
taskstackai claim 7
# ... do the work ...
taskstackai close 7
```

### Create a new issue

```
taskstackai create "Refactor authentication middleware"
```

### List all issues as JSON

```
taskstackai list --json
```
