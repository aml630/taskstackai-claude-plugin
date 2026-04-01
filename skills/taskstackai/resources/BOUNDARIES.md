# taskstackai vs TodoWrite — Decision Guide

## Comparison

| Capability | `taskstackai` | `TodoWrite` |
|------------|-------|-------------|
| Multi-session persistence | Yes — server-side | No — lost on session end |
| Survives compaction | Yes — restored via `taskstackai prime` | No — ephemeral |
| Team visibility | Yes — shared across users/agents | No — local only |
| Dependency tracking | Yes — directed graph with cycle detection | No |
| Audit trail | Yes — full event history | No |
| Labels and metadata | Yes — types, priorities, labels, comments | No |
| Setup required | Yes — `taskstackai init` + API key | None |
| Latency | Network round-trip | Instant (in-memory) |
| Complexity | Full issue tracker | Simple checklist |

## Decision Tree

```
Is the task just for right now, within this single session?
├── Yes → Is it a simple linear checklist (no dependencies)?
│   ├── Yes → Use TodoWrite
│   └── No  → Use taskstackai
└── No  → Use taskstackai
```

## When to Use `taskstackai`

- Work that spans multiple sessions or survives compaction.
- Tasks that other team members or agents need to see.
- Anything requiring dependency ordering.
- Work that needs an audit trail (who did what, when).
- Bug tracking, feature planning, sprint management.

## When to Use `TodoWrite`

- Quick scratch lists for the current session only.
- Personal step-by-step checklists you will complete before the session ends.
- Notes you do not need to persist.

## Rule of Thumb

If you would be upset losing the information after compaction, use `taskstackai`.
If it is throwaway notes for the next ten minutes, use `TodoWrite`.
