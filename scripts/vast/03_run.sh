
#!/usr/bin/env bash
set -euo pipefail

cd "$HOME/SubgraphRAG/reason"
export WANDB_MODE=offline

# 使用本地 Qwen Reader 复现 WebQSP
conda run -n subgraphrag-reason python main.py \
    -d webqsp \
    --split test \
    --prompt_mode scored_100 \
    --llm_mode sys_icl_dc \
    --model_name Qwen/Qwen2.5-7B-Instruct \
    --tensor_parallel_size 1 \
    --temperature 0 \
    --frequency_penalty 0.16
