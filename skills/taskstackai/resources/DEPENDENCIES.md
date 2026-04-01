# Dependency Management

## Overview

TaskStackAi tracks directed dependencies between issues. An issue is **blocked**
when it depends on another issue that is not yet closed. An issue is **ready**
when all its dependencies are satisfied (closed).

## Adding and Removing Dependencies

```bash
# Issue 5 cannot start until issue 3 is closed
taskstackai dep add 5 --blocked-by 3

# Remove the dependency
taskstackai dep rm 5 --blocked-by 3
```

## Querying Dependencies

```bash
# What is blocking issue 5?
taskstackai dep blocked-by 5

# What issues does issue 3 block?
taskstackai dep blocks 3

# List all currently blocked issues
taskstackai blocked --json
```

## Cycle Prevention

The server performs a BFS traversal when you add a dependency. If adding the
edge would create a cycle (A blocks B blocks C blocks A), the server rejects
the request with an error. You do not need to check for cycles yourself — the
server handles it.

Example error:

```
Error: adding dependency 3 → 5 would create a cycle: 5 → 7 → 3
```

## Blocked vs Ready States

| State | Meaning |
|-------|---------|
| **Ready** | All dependencies are closed. Issue can be worked on. |
| **Blocked** | One or more dependencies are still open. |
| **In Progress** | Issue has been claimed and is being worked on. |
| **Closed** | Issue is complete. |

An issue transitions from blocked to ready automatically when its last open
dependency is closed.

## How Closing Unblocks Dependents

When you close issue A:

1. The server finds all issues that list A as a dependency.
2. For each dependent, it checks whether any other open dependencies remain.
3. If none remain, the dependent becomes ready.

This is fully server-side — you just close the issue and the graph updates.

```bash
# Issue 10 is blocked by issues 8 and 9
taskstackai dep blocked-by 10
# → 8 (open), 9 (open)

taskstackai close 8 --reason "Done"
# Issue 10 is still blocked (by 9)

taskstackai close 9 --reason "Done"
# Issue 10 is now ready
```

## Best Practices

- Keep dependency chains short (ideally 2-3 levels deep).
- Use `taskstackai blocked` regularly to spot issues stuck in the queue.
- When creating subtasks for an epic, add dependencies to enforce ordering
  only where genuinely needed — do not over-constrain.
