# Issue Creation Best Practices

## Good Titles

Titles should be action-oriented and specific:

| Bad | Good |
|-----|------|
| "Auth" | "Add JWT refresh token endpoint" |
| "Bug" | "Fix null pointer when cart is empty" |
| "Tests" | "Add integration tests for payment flow" |
| "Cleanup" | "Remove deprecated v1 API routes" |

## Issue Types

| Type | When to Use |
|------|-------------|
| `bug` | Something is broken and needs fixing |
| `feature` | New user-facing functionality |
| `task` | Internal work (refactor, config, setup) |
| `epic` | A collection of related subtasks |
| `chore` | Maintenance (upgrades, cleanup, docs) |

```bash
taskstackai create "Add password reset flow" --type feature
taskstackai create "Fix race condition in cache" --type bug
```

## Priority Guidelines

| Priority | Meaning | Response Time |
|----------|---------|---------------|
| P0 | Critical — system down or data loss | Immediate |
| P1 | High — major feature broken, blocks users | Same day |
| P2 | Medium — important but not urgent | This sprint |
| P3 | Low — nice to have | Next sprint |
| P4 | Backlog — someday/maybe | When convenient |

```bash
taskstackai create "Production DB connection pool exhausted" --type bug --priority P0
taskstackai create "Add dark mode toggle" --type feature --priority P3
```

## Writing Descriptions

Include three things: **what**, **why**, and **acceptance criteria**.

```bash
taskstackai create "Add rate limiting to public API" --type task --priority P1 \
  --desc "What: Add rate limiting (100 req/min per API key) to all public endpoints.
Why: We are seeing abuse from scrapers causing slow responses for legitimate users.
Acceptance criteria:
- Requests beyond 100/min return 429
- Rate limit headers present in all responses
- Rate limits are per-API-key, not per-IP
- Dashboard shows rate limit stats"
```

## Epics vs Tasks

Use an **epic** when:
- The work has 3+ distinct subtasks.
- Different people/agents could work on parts in parallel.
- You want a single view of overall progress.

Use a **task** when:
- The work is a single unit that one person completes.
- It takes less than a session to finish.

## Linking with Dependencies

Add dependencies when one issue genuinely cannot start until another finishes:

```bash
# Database schema must exist before the API can use it
taskstackai dep add <api-task> --blocked-by <schema-task>
```

Do not over-link. If two tasks can be done in any order, do not add a
dependency between them.
