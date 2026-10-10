

#!/usr/bin/env bash
set -euo pipefail

# SubgraphRAG + Qwen2.5-7B-Instruct
# Vast.ai Linux 首次部署

nvidia-smi

# 获取代码
git clone https://github.com/38500/SubgraphRAG.git "$HOME/SubgraphRAG"

# 创建 Reader 环境
conda create -n subgraphrag-reason python=3.10 -y

# 安装 Reader 依赖
conda run -n subgraphrag-reason python -m pip install \
    "vllm==0.6.6.post1" \
    "datasets" \
    "huggingface_hub" \
    "openai==1.50.2" \
    "wandb" \
    "tqdm" \
    "numpy"

# 验证环境
conda run -n subgraphrag-reason python -m pip check

conda run -n subgraphrag-reason python -c \
    "import torch, vllm, datasets; print('PyTorch:', torch.__version__); print('vLLM:', vllm.__version__); print('CUDA available:', torch.cuda.is_available())"

echo "Reader 环境准备完成"
