#!/bin/bash
# SessionStart hook: inject TaskStackAi workflow context at the start of every Claude session.
# This runs `taskstackai prime` which outputs the current project state, commands reference,
# and session protocol so the agent has full context immediately.

# Find taskstackai CLI - check common locations
TASKSTACKAI=""
if command -v taskstackai &>/dev/null; then
    TASKSTACKAI="taskstackai"
elif [[ -f "$CLAUDE_PROJECT_DIR/.taskstackai/bin/taskstackai" ]]; then
    TASKSTACKAI="$CLAUDE_PROJECT_DIR/.taskstackai/bin/taskstackai"
fi

if [[ -n "$TASKSTACKAI" ]]; then
    $TASKSTACKAI prime 2>/dev/null
fi

exit 0
