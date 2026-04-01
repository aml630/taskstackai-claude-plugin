# Integration Patterns

## CI/CD Integration

Use `taskstackai export` in CI pipelines to generate reports or sync state:

```bash
# In your CI script
taskstackai export --format json > issues-snapshot.json

# Close issues automatically when tests pass
taskstackai close 15 --reason "Verified by CI pipeline run #482"
```

## Git Hooks

Auto-close issues referenced in commit messages:

```bash
# .git/hooks/post-commit example
MSG=$(git log -1 --format=%B)
# Look for "closes #42" or "fixes #42"
ID=$(echo "$MSG" | grep -oP '(?:closes|fixes)\s+#(\d+)' | grep -oP '\d+')
if [ -n "$ID" ]; then
  taskstackai close "$ID" --reason "Closed by commit $(git rev-parse --short HEAD)"
fi
```

## Multiple Repositories

A single TaskStackAi organization can manage multiple projects. Each repo has
its own `.taskstackai/config` pointing to the same server but different project IDs:

```bash
# In repo A
taskstackai init --server https://api.taskstackai.com --project frontend

# In repo B
taskstackai init --server https://api.taskstackai.com --project backend
```

Cross-project dependencies are managed at the organization level. Issues
from different projects can reference each other.

## API Key Scopes

Follow least-privilege principles:

| Integration | Recommended Scopes |
|-------------|-------------------|
| CI read-only reporter | `read` |
| CI that closes issues | `read,write` |
| Developer CLI | `read,write` |
| Admin tools | `read,write,admin` |
| AI agent | `read,write` |

```bash
# Create a scoped key for CI
taskstackai apikey create "ci-pipeline" --scopes read,write

# Create a read-only key for dashboards
taskstackai apikey create "dashboard" --scopes read
```

## Webhook Patterns

If the TaskStackAi server supports webhooks, configure them for:

- **Issue closed** — trigger deployment pipelines.
- **Issue created** — notify a Slack channel.
- **Dependency resolved** — alert the assigned agent that work is unblocked.

## Export for External Tools

```bash
# JSON for programmatic consumption
taskstackai export --format json > issues.json

# CSV for spreadsheets
taskstackai export --format csv > issues.csv
```
