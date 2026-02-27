#!/bin/bash
# sessionStart hook - 在 IDE 模式下触发，CLI 模式下可能不触发（已知 Bug）

INPUT=$(cat)
echo "[HOOK] sessionStart triggered at $(date)" >> /tmp/cursor-hooks.log
echo '{"exitCode": 0}'
exit 0
