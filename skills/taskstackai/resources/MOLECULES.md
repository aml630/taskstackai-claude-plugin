# Issue Molecules — Template Patterns

## What Are Molecules?

A "molecule" is a standard set of related issues with predefined dependencies
that represent a common workflow. TaskStackAi does not have built-in molecule
support yet, but you can create them manually as a pattern.

## Feature Molecule

A standard feature requires design, implementation, testing, and documentation:

```bash
# Create the epic
taskstackai create "Feature: user profile avatars" --type epic --priority P2

# Create the subtasks
taskstackai create "Design avatar storage schema" --type task
taskstackai create "Implement avatar upload endpoint" --type task
taskstackai create "Implement avatar display component" --type task
taskstackai create "Add avatar tests" --type task
taskstackai create "Document avatar API" --type task

# Link to epic (assuming IDs 100-105)
taskstackai epic subtask 100 101
taskstackai epic subtask 100 102
taskstackai epic subtask 100 103
taskstackai epic subtask 100 104
taskstackai epic subtask 100 105

# Set dependencies
taskstackai dep add 102 --blocked-by 101  # upload needs schema
taskstackai dep add 103 --blocked-by 102  # display needs upload
taskstackai dep add 104 --blocked-by 103  # tests need implementation
taskstackai dep add 105 --blocked-by 102  # docs need upload API
```

## Bug Fix Molecule

```bash
taskstackai create "Bug: login fails on Safari" --type bug --priority P1
taskstackai create "Write regression test for Safari login" --type task
taskstackai create "Fix Safari login compatibility" --type task

taskstackai dep add 202 --blocked-by 201  # reproduce first
taskstackai dep add 203 --blocked-by 202  # then fix
```

## Refactor Molecule

```bash
taskstackai create "Refactor: extract auth into shared module" --type epic
taskstackai create "Audit current auth usage across codebase" --type task
taskstackai create "Create shared auth module" --type task
taskstackai create "Migrate services to shared module" --type task
taskstackai create "Remove old auth code" --type task

taskstackai dep add 302 --blocked-by 301
taskstackai dep add 303 --blocked-by 302
taskstackai dep add 304 --blocked-by 303
```

## Sprint Planning Molecule

```bash
# Create a mix of work for a sprint
taskstackai create "Sprint 5 planning" --type epic
taskstackai create "Feature: dark mode" --type feature --priority P2
taskstackai create "Fix: memory leak in dashboard" --type bug --priority P1
taskstackai create "Chore: upgrade dependencies" --type chore --priority P3

taskstackai epic subtask 400 401
taskstackai epic subtask 400 402
taskstackai epic subtask 400 403
```

## Tips

- Keep molecules small (3-6 issues). Larger ones should be split into
  multiple molecules.
- Only add dependencies where ordering genuinely matters.
- Use labels to group molecule members: `taskstackai label add <id> "avatar-feature"`.
