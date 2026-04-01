---
description: Explain the standard taskstackai workflow
---

Explain the standard TaskStackAi workflow to the user:

1. **`/ready`** -- See what issues are unblocked and available to work on.
2. **`/show <id>`** -- Inspect an issue to understand the details before starting.
3. **`/claim <id>`** -- Claim the issue (assigns to you and sets status to in_progress).
4. **Work** -- Do the actual development work on the issue.
5. **`/close <id>`** -- Close the issue when the work is complete.
6. **Push** -- Push your changes via git.

This is the recommended flow. Users can also create issues with `/create`, manage dependencies with `/dep`, and search with `/search`. Use `/prime` at any time to see current project context.
