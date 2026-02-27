#!/bin/bash
# beforeShellExecution hook - 在 CLI 模式下可靠触发
# 通过 stdin 接收 JSON，通过 stdout 返回 JSON
# 退出码: 0=允许, 2=阻止

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.command // empty')

echo "[HOOK] beforeShellExecution triggered: $COMMAND" >> /tmp/cursor-hooks.log

BLOCKED_PATTERNS="rm -rf /|DROP DATABASE|:(){ :|:& };:"
if echo "$COMMAND" | grep -qE "$BLOCKED_PATTERNS"; then
    echo '{"exitCode": 2, "message": "Dangerous command blocked by hook"}' 
    exit 2
fi

echo '{"exitCode": 0}'
exit 0
