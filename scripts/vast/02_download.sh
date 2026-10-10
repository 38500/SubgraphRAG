
#!/usr/bin/env bash
set -euo pipefail

cd "$HOME/SubgraphRAG/reason"
export PATH="$(conda run -n subgraphrag-reason python -c 'import sys; print(sys.prefix)')/bin:$PATH"

# 官方 WebQSP 检索结果
hf download siqim311/SubgraphRAG \
    scored_triples/webqsp_240912_unidir_test.pth \
    --repo-type model \
    --local-dir .

# RoG 预测数据
hf download siqim311/SubgraphRAG \
    results/KGQA/webqsp/RoG/test/results_gen_rule_path_RoG-webqsp_RoG_test_predictions_3_False_jsonl/predictions.jsonl \
    --repo-type model \
    --local-dir .

# Qwen2.5-7B-Instruct：提前下载至 Hugging Face 缓存
hf download Qwen/Qwen2.5-7B-Instruct

# 下载并缓存 Reader 使用的逐题子图
conda run -n subgraphrag-reason python -c \
    "from datasets import load_dataset; ds = load_dataset('rmanluo/RoG-webqsp', split='test'); print('WebQSP samples:', len(ds))"

echo "WebQSP Reader 数据准备完成"
