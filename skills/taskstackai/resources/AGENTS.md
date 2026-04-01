# Agent Instructions

This project uses **TaskStackAi** for ALL issue tracking. Do NOT use markdown TODOs, task lists, or other tracking methods.

## Workflow

Every AI agent follows the same loop:

```
ready → claim → work → close → repeat
```

```bash
taskstackai ready              # Find available work
taskstackai show <id> --long   # View full issue context
taskstackai claim <id>         # Claim work (assign + set in_progress)
taskstackai close <id>         # Complete work
```

## Quick Reference

```bash
# Core workflow
taskstackai ready                           # Unblocked issues ready to work
taskstackai create "Title" -t task -p 2     # Create an issue
taskstackai show <id>                       # View issue details (--long for full)
taskstackai claim <id>                      # Claim an issue
taskstackai close <id> --reason "Done"      # Close with reason
taskstackai update <id> --title "New title" # Update fields inline
taskstackai list                            # List all issues
taskstackai search "query"                  # Full-text search

# Dependencies
taskstackai dep add <id> <depends-on-id>    # Add dependency
taskstackai dep rm <id> <depends-on-id>     # Remove dependency
taskstackai dep blocks <id>                 # What this issue blocks
taskstackai dep blocked-by <id>             # What blocks this issue

# Epics
taskstackai update <id> --type epic         # Promote issue to epic
taskstackai epic subtask <epic-id> "Title"  # Create NEW subtask under epic (takes a title, NOT an existing issue ID)
taskstackai epic tree <epic-id>             # Show epic tree view
taskstackai epic list                       # List all epics

# Labels
taskstackai label add <issue-id> <label>    # Assign label to issue
taskstackai label rm <issue-id> <label>     # Remove label from issue
taskstackai label list                      # List all labels

# Comments
taskstackai comment add <id> "text"         # Add comment to issue
taskstackai comment list <id>               # List comments on issue
```

Always use `--json` when parsing output programmatically.

## Priorities

- **P0** — Critical (security, data loss, broken builds)
- **P1** — High (major features, important bugs)
- **P2** — Medium (default)
- **P3** — Low (polish, optimization)
- **P4** — Backlog (future ideas)

## Issue Types

- `task` — Work item (default)
- `bug` — Something broken
- `feature` — New functionality
- `epic` — Large feature with subtasks
- `chore` — Maintenance

## Agent Best Practices

1. **Check ready work first**: `taskstackai ready` shows unblocked issues
2. **Always claim before starting**: `taskstackai claim <id>`
3. **Discover new work?** Create a linked issue — don't stop current work to fix it:
   ```bash
   taskstackai create "Found bug in X" -t bug -p 1
   taskstackai dep add <new-id> <current-id>
   ```
4. **Close with descriptive reasons**: `taskstackai close <id> --reason "Implemented; tests pass"`
5. **Respect priority order**: P0 first, then P1, then P2+
6. **Do NOT create markdown TODO lists** — use TaskStackAi issues instead
7. **Do NOT use external issue trackers** — TaskStackAi is the single source of truth

## Interactive Command Warnings

**Do NOT use commands that open an interactive editor** — they will hang the agent.

Use flags to update fields inline instead:
```bash
taskstackai update <id> --description "new description"
taskstackai update <id> --title "new title"
```

For descriptions with special characters (backticks, quotes, exclamation marks), pipe via stdin:
```bash
echo 'Description with `backticks` and "quotes"' | taskstackai create "Title" --description=-
echo 'Updated text' | taskstackai update <id> --description=-
```

## Session Completion

**When ending a work session**, complete ALL steps below. Work is NOT complete until `git push` succeeds.

1. **File issues for remaining work** — Create TaskStackAi issues for anything that needs follow-up
2. **Run quality gates** (if code changed) — Tests, linters, builds
3. **Update issue status** — Close finished work, update in-progress items
4. **Commit and push**:
   ```bash
   git add <files>
   git commit -m "description of changes"
   git pull --rebase
   git push
   git status  # MUST show "up to date with origin"
   ```
5. **Clean up** — Clear stashes, prune remote branches
6. **Hand off** — Provide context for the next session

**Critical rules:**
- Work is NOT complete until `git push` succeeds
- NEVER stop before pushing — that leaves work stranded locally
- NEVER say "ready to push when you are" — YOU must push
- If push fails, resolve and retry until it succeeds

## Non-Interactive Shell Commands

Always use non-interactive flags to avoid hanging on prompts:

```bash
cp -f source dest       # NOT: cp source dest
mv -f source dest       # NOT: mv source dest
rm -f file              # NOT: rm file
rm -rf directory        # NOT: rm -r directory
cp -rf source dest      # NOT: cp -r source dest
```

Other commands that may prompt:
- `scp` — use `-o BatchMode=yes`
- `ssh` — use `-o BatchMode=yes`
- `apt-get` — use `-y` flag
- `brew` — use `HOMEBREW_NO_AUTO_UPDATE=1`
