---
description: Guide new users through TaskStackAi setup and first steps
---

Walk the user through getting started with TaskStackAi step by step:

1. **Setup**: If not already set up, run `/setup` to connect to the TaskStackAi server.
2. **Create an issue**: Use `/create` to make a first issue. Example:
   ```
   taskstackai create --title "My first task" --type task --priority 2 --json
   ```
3. **View it**: Use `/show <id>` to see the issue details.
4. **Claim it**: Use `/claim <id>` to assign it to yourself and start work.
5. **Close it**: Use `/close <id>` when done.

After walking through these steps, mention `/prime` for context recovery.
