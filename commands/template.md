---
description: Issue templates (not yet built-in)
---

TaskStackAi does not have a built-in template system yet. However, you can achieve a similar effect by using `/create` with predefined fields.

Suggest the user create a reusable snippet or alias for common issue patterns. For example, a bug report template:
```
${CLAUDE_PLUGIN_DIR}/bin/taskstackai create --title "Bug: <summary>" --type bug --priority 1 --description "Steps to reproduce:\n1.\n2.\n\nExpected:\nActual:" --json
```

Or a feature request:
```
${CLAUDE_PLUGIN_DIR}/bin/taskstackai create --title "Feature: <summary>" --type feature --priority 3 --description "As a user, I want..." --json
```

Help the user construct a `${CLAUDE_PLUGIN_DIR}/bin/taskstackai create` command matching their desired template.
