#!/bin/bash
# afterShellExecution hook - 在 CLI 模式下可靠触发

INPUT=$(cat)
echo "[HOOK] afterShellExecution triggered" >> /tmp/cursor-hooks.log
echo '{"exitCode": 0}'
exit 0
