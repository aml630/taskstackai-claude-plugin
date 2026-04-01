# Common Usage Patterns

## Bug Triage

```bash
# Report the bug
taskstackai create "Null pointer in payment processing" --type bug --priority P0

# Add details
taskstackai comment add 30 "Reproducible when cart is empty. Stack trace in server.log:142."

# Label it
taskstackai label add 30 "backend"
taskstackai label add 30 "payments"

# Claim and fix
taskstackai claim 30
# ... fix the code, write a test, commit ...
taskstackai close 30 --reason "Added null check for empty cart; regression test added"
```

## Feature Development

```bash
# Create the epic
taskstackai create "Dark mode support" --type epic --priority P2

# Break into subtasks
taskstackai create "Design dark mode color tokens" --type task
taskstackai create "Implement theme switcher component" --type task
taskstackai create "Update all components for theme support" --type task
taskstackai create "Add dark mode tests" --type task

# Link to epic
taskstackai epic subtask 40 41
taskstackai epic subtask 40 42
taskstackai epic subtask 40 43
taskstackai epic subtask 40 44

# Set dependency chain
taskstackai dep add 42 --blocked-by 41   # switcher needs tokens
taskstackai dep add 43 --blocked-by 42   # components need switcher
taskstackai dep add 44 --blocked-by 43   # tests need components

# Work through in order as each becomes ready
taskstackai ready
```

## Code Review

```bash
# Create a review task linked to a PR
taskstackai create "Review PR #87: refactor auth middleware" --type task --priority P1
taskstackai comment add 50 "PR: https://github.com/org/repo/pull/87"
taskstackai label add 50 "review"

# Reviewer claims it
taskstackai claim 50
# ... review the PR ...
taskstackai close 50 --reason "Approved with minor suggestions; no blocking issues"
```

## Multi-Agent Parallel Work

Multiple AI agents can work simultaneously on the same project:

```bash
# Agent A:
taskstackai ready --json          # sees issues 10, 11, 12
taskstackai claim 10              # takes issue 10

# Agent B (concurrently):
taskstackai ready --json          # sees issues 11, 12 (10 is claimed)
taskstackai claim 11              # takes issue 11

# Agent C:
taskstackai ready --json          # sees issue 12
taskstackai claim 12              # takes issue 12
```

Each agent works independently. Claims prevent duplicate work. When an agent
closes an issue, new issues may become unblocked for other agents.

## Discovery During Work

While working on issue 10, you find a related problem:

```bash
# Create the discovered issue immediately
taskstackai create "Race condition in cache invalidation" --type bug --priority P1

# Link it if it's related
taskstackai dep add 55 --blocked-by 10   # new issue needs this fix first

# Continue working on 10 — don't context-switch
taskstackai close 10 --reason "Fixed the auth bug; filed #55 for related cache issue"
```
