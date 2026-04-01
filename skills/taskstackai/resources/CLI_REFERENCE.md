# taskstackai CLI Reference

Global flags available on all commands:

| Flag | Description |
|------|-------------|
| `--json` | Output machine-readable JSON |
| `--help` | Show help for any command |

---

## Core Commands

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai init` | `taskstackai init [--server URL] [--key KEY]` | Initialize `.taskstackai/config` in the current project |
| `taskstackai prime` | `taskstackai prime` | Print full context summary for AI sessions |
| `taskstackai ready` | `taskstackai ready [--json]` | List issues with all dependencies met |
| `taskstackai create` | `taskstackai create "title" [--type TYPE] [--priority P] [--desc "..."]` | Create a new issue |
| `taskstackai show` | `taskstackai show <id> [--long] [--json]` | Show issue details (`--long` for full context) |
| `taskstackai list` | `taskstackai list [--status S] [--type T] [--label L] [--json]` | List issues with optional filters |
| `taskstackai update` | `taskstackai update <id> [--title T] [--desc D] [--priority P] [--type T]` | Update issue fields |
| `taskstackai close` | `taskstackai close <id> [--reason "..."]` | Close an issue |
| `taskstackai reopen` | `taskstackai reopen <id>` | Reopen a closed issue |
| `taskstackai claim` | `taskstackai claim <id>` | Claim an issue (mark in-progress) |
| `taskstackai search` | `taskstackai search "query" [--json]` | Full-text search across issues |
| `taskstackai stats` | `taskstackai stats [--json]` | Summary statistics for the project |
| `taskstackai blocked` | `taskstackai blocked [--json]` | List issues blocked by unmet dependencies |

## Dependencies

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai dep add` | `taskstackai dep add <id> --blocked-by <dep-id>` | Add a dependency |
| `taskstackai dep rm` | `taskstackai dep rm <id> --blocked-by <dep-id>` | Remove a dependency |
| `taskstackai dep blocks` | `taskstackai dep blocks <id>` | List issues this one blocks |
| `taskstackai dep blocked-by` | `taskstackai dep blocked-by <id>` | List issues blocking this one |

## Epics

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai epic list` | `taskstackai epic list [--json]` | List all epics |
| `taskstackai epic tree` | `taskstackai epic tree <id>` | Show epic with subtask tree |
| `taskstackai epic subtask` | `taskstackai epic subtask <epic-id> <task-id>` | Add a task as subtask of an epic |

## Labels

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai label list` | `taskstackai label list` | List all labels |
| `taskstackai label create` | `taskstackai label create "name" [--color HEX]` | Create a label |
| `taskstackai label add` | `taskstackai label add <issue-id> "label"` | Add label to an issue |
| `taskstackai label rm` | `taskstackai label rm <issue-id> "label"` | Remove label from an issue |
| `taskstackai label delete` | `taskstackai label delete "name"` | Delete a label |

## Comments

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai comment add` | `taskstackai comment add <id> "text"` | Add a comment to an issue |
| `taskstackai comment list` | `taskstackai comment list <id>` | List comments on an issue |
| `taskstackai comment edit` | `taskstackai comment edit <comment-id> "text"` | Edit a comment |
| `taskstackai comment delete` | `taskstackai comment delete <comment-id>` | Delete a comment |

## Events

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai event list` | `taskstackai event list [--json]` | List recent events across the project |
| `taskstackai event issue` | `taskstackai event issue <id>` | List events for a specific issue |

## Dashboard

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai dashboard stats` | `taskstackai dashboard stats [--json]` | Project-level statistics |
| `taskstackai dashboard burndown` | `taskstackai dashboard burndown [--days N]` | Burndown chart data |
| `taskstackai dashboard velocity` | `taskstackai dashboard velocity [--sprints N]` | Velocity over recent sprints |
| `taskstackai dashboard activity` | `taskstackai dashboard activity [--days N]` | Recent activity feed |

## Data

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai export` | `taskstackai export [--format json\|csv]` | Export all issues |
| `taskstackai import` | `taskstackai import <file>` | Import issues from file |

## Organization

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai org me` | `taskstackai org me` | Show current user info |
| `taskstackai org members` | `taskstackai org members` | List org members |
| `taskstackai org invite` | `taskstackai org invite <email> [--role ROLE]` | Invite a member |

## API Keys

| Command | Usage | Description |
|---------|-------|-------------|
| `taskstackai apikey list` | `taskstackai apikey list` | List API keys |
| `taskstackai apikey create` | `taskstackai apikey create "name" [--scopes S]` | Create a new API key |
| `taskstackai apikey delete` | `taskstackai apikey delete <key-id>` | Delete an API key |
