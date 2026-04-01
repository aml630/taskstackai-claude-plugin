# Troubleshooting

## Common Errors

### "No .taskstackai/config found"

The project has not been initialized.

```bash
taskstackai init --server https://api.taskstackai.com --key YOUR_API_KEY
```

This creates `.taskstackai/config` in the current directory.

### API Connection Errors

```
Error: could not connect to server
```

- Verify the server URL in `.taskstackai/config` is correct.
- Check network connectivity: `curl -s https://api.taskstackai.com/health`
- If self-hosted, confirm the server process is running.

### 401 Unauthorized

```
Error: 401 Unauthorized
```

The API key is expired or invalid.

- Check the key in `.taskstackai/config`.
- Generate a new key: `taskstackai apikey create "new-key" --scopes read,write`
- Update `.taskstackai/config` with the new key.

### 403 Forbidden

```
Error: 403 Forbidden — insufficient scopes
```

The API key does not have the required permissions.

- List key scopes: `taskstackai apikey list`
- Create a key with the needed scopes: `taskstackai apikey create "full" --scopes read,write,admin`

### 404 Not Found

```
Error: 404 Not Found — issue 999 does not exist
```

The issue ID is wrong or was deleted.

- Verify with `taskstackai list --json` or `taskstackai search "keyword"`.

### 409 Conflict

```
Error: 409 Conflict — issue already claimed by another user
```

Another agent or team member is already working on this issue.

- Check with `taskstackai show <id>` to see who claimed it.
- Pick a different ready issue: `taskstackai ready`

### Rate Limited

```
Error: 429 Too Many Requests
```

- Wait a few seconds and retry.
- If persistent, reduce request frequency or upgrade your plan.
- Use `--json` to batch-parse results instead of making repeated calls.

### Dependency Cycle

```
Error: adding dependency would create a cycle
```

The server detected that adding this dependency would create a circular chain.

- Review the existing dependency graph: `taskstackai dep blocked-by <id>`
- Restructure the dependency to avoid the cycle.

## Diagnostic Commands

```bash
# Check project and connection status
taskstackai status

# View recent events for debugging
taskstackai event list

# Export all data for inspection
taskstackai export --format json > debug-export.json
```
