#!/usr/bin/env python3
"""
从中文新闻网站获取热门新闻
无需API密钥，使用公开的新闻源
"""

import requests
from bs4 import BeautifulSoup
import json
from datetime import datetime

# 新闻源配置
NEWS_SOURCES = {
    "新浪热点": {
        "url": "https://news.sina.com.cn/",
        "title_selector": ".news-item h1, .news-item h2, h1, h2",
        "default_titles": ["暂无实时新闻，请稍后再试"]
    },
    "网易新闻": {
        "url": "https://news.163.com/",
        "title_selector": ".news_title h2, .news_title h3, h2, h3",
        "default_titles": ["暂无实时新闻，请稍后再试"]
    },
    "央视新闻": {
        "url": "https://news.cctv.com/",
        "title_selector": ".title, h2, h3",
        "default_titles": ["暂无实时新闻，请稍后再试"]
    }
}

def get_news():
    news_list = []
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    for source_name, source_config in NEWS_SOURCES.items():
        try:
            print(f"正在获取 {source_name} 的新闻...")
            headers = {
                'User-Agent': 'Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36'
            }
            response = requests.get(source_config["url"], headers=headers, timeout=10)
            soup = BeautifulSoup(response.content, 'html.parser', from_encoding='utf-8')

            # 尝试提取标题
            titles = []
            for selector in source_config["title_selector"].split(','):
                elements = soup.select(selector.strip())
                if elements:
                    titles.extend([elem.get_text().strip() for elem in elements[:5]])
                    break

            if titles:
                # 去重并限制数量
                unique_titles = list(dict.fromkeys(titles))[:3]
                news_list.extend([f"【{source_name}】{title}" for title in unique_titles])
            else:
                news_list.append(f"【{source_name}】{source_config['default_titles'][0]}")

        except Exception as e:
            print(f"获取 {source_name} 新闻失败: {e}")
            news_list.append(f"【{source_name}】新闻获取失败")

    # 限制新闻总数
    news_list = news_list[:8] if news_list else ["今日新闻获取失败，请稍后再试"]

    result = {
        "timestamp": current_time,
        "news": news_list
    }

    return result

if __name__ == "__main__":
    news_data = get_news()
    print(f"\n{'='*60}")
    print(f"📰 今日热点新闻 ({news_data['timestamp']})")
    print(f"{'='*60}\n")

    for i, news in enumerate(news_data['news'], 1):
        print(f"{i}. {news}")

    print(f"\n{'='*60}\n")
