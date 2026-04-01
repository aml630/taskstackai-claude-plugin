# TaskStackAi Workflows

## Daily Workflow

The standard loop for each coding session:

```bash
# 1. Load context (especially after compaction)
taskstackai prime

# 2. See what's ready
taskstackai ready

# 3. Pick an issue and claim it
taskstackai claim 12

# 4. Read the details
taskstackai show 12 --long

# 5. Do the work (edit code, run tests, commit)

# 6. Close with a reason
taskstackai close 12 --reason "Added input validation for email field"

# 7. Check for more work
taskstackai ready
```

## Creating Epics with Subtasks

```bash
# Create the epic
taskstackai create "User authentication system" --type epic --priority P1

# Create subtasks
taskstackai create "Design auth database schema" --type task
taskstackai create "Implement login endpoint" --type task
taskstackai create "Implement signup endpoint" --type task
taskstackai create "Add JWT token refresh" --type task

# Link subtasks to the epic
taskstackai epic subtask 1 2
taskstackai epic subtask 1 3
taskstackai epic subtask 1 4
taskstackai epic subtask 1 5

# Set dependencies (signup before login makes sense here)
taskstackai dep add 3 --blocked-by 2   # login blocked by schema
taskstackai dep add 4 --blocked-by 2   # signup blocked by schema
taskstackai dep add 5 --blocked-by 3   # refresh blocked by login
```

## Managing Dependencies

```bash
# Add a dependency
taskstackai dep add 10 --blocked-by 8

# See what blocks an issue
taskstackai dep blocked-by 10

# See what an issue is blocking
taskstackai dep blocks 8

# Remove a dependency
taskstackai dep rm 10 --blocked-by 8

# View all blocked issues
taskstackai blocked
```

When you close a blocking issue, its dependents automatically become ready
(if they have no other unmet dependencies).

## Team Collaboration

```bash
# Claim work so others know you're on it
taskstackai claim 15

# Add context via comments
taskstackai comment add 15 "Found the root cause — race condition in the cache layer"

# Label for categorization
taskstackai label add 15 "backend"
taskstackai label add 15 "urgent"

# Check what others are working on
taskstackai list --status in_progress
```

## Sprint Workflow

```bash
# 1. Plan: create issues for the sprint
taskstackai create "Feature X" --type feature --priority P1
taskstackai create "Fix bug Y" --type bug --priority P0

# 2. Prioritize and add dependencies
taskstackai dep add 22 --blocked-by 21

# 3. Work through ready issues
taskstackai ready
taskstackai claim 21
# ... work ...
taskstackai close 21 --reason "Shipped feature X"

# 4. Review progress
taskstackai dashboard stats
taskstackai dashboard burndown --days 14
taskstackai dashboard velocity --sprints 3
```
