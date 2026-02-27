#!/bin/bash
# afterFileEdit hook - 在 IDE 模式下触发，CLI 模式下可能不触发（已知 Bug）

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.filePath // empty')

echo "[HOOK] afterFileEdit triggered: $FILE" >> /tmp/cursor-hooks.log
echo '{"exitCode": 0}'
exit 0
