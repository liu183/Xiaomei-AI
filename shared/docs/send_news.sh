#!/bin/bash
# 获取并发送新闻到主人
# 用法: ./send_news.sh

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 运行新闻获取脚本
python3 "${SCRIPT_DIR}/get_hotnews.py" > /tmp/daily_news.txt 2>&1
