
#!/usr/bin/env bash
set -euo pipefail

# 备份 SubgraphRAG 的 Reader 推理结果
rclone copy -P \
    "$HOME/SubgraphRAG/reason/results/KGQA/webqsp/SubgraphRAG" \
    "myb2:nixiaoyan/SubgraphRAG/webqsp"

echo "B2 备份完成"
