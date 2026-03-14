#!/bin/bash
# 获取并发送新闻到主人

cd /home/pi/.openclaw/workspace/scripts
python3 get_hotnews.py > /tmp/daily_news.txt 2>&1
