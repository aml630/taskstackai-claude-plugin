# Context Recovery and Resumability

## The Problem

AI coding sessions lose context when the conversation is compacted or when a
new session begins. TaskStackAi solves this by keeping all issue state on the
server and providing fast context-reload commands.

## `taskstackai prime` — Full Context Reload

```bash
taskstackai prime
```

This prints a structured summary of the entire project state: open issues,
in-progress work, blocked items, and recent activity. It is designed to be
consumed by an AI agent at the start of a session.

Run `taskstackai prime` in these situations:
- Start of every new session
- After a compaction event
- When you feel you have lost track of the project state

## SessionStart Hook

The TaskStackAi plugin registers a `SessionStart` hook that automatically runs
`taskstackai prime` when a new Claude Code session begins. You do not need to invoke
it manually in most cases — context is injected automatically.

## PreCompact Hook

Before a compaction occurs, the `PreCompact` hook runs `taskstackai prime` and injects
the output into the compacted context. This ensures the AI retains awareness
of the issue tracker state even after losing conversation history.

## Finding Current Work After Compaction

If you are mid-task when compaction happens, find your in-progress work:

```bash
# List everything you're currently working on
taskstackai list --status in_progress --json
```

Then reload full context for each issue:

```bash
taskstackai show <id> --long
```

The `--long` flag includes the full description, all comments, dependency
graph, and event history — everything needed to resume work.

## Recovery Checklist

After context loss (compaction, new session, crash):

1. `taskstackai prime` — get the big picture
2. `taskstackai list --status in_progress` — find anything you were mid-way through
3. `taskstackai show <id> --long` — reload full context for each active issue
4. Continue working — claim new issues or finish in-progress ones
