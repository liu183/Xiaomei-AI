# OpenClaw 问题修复记录

## 问题：输入 tokens 超限

**错误信息**: The input (204281 tokens) is longer than the model's context length (202752 tokens)

**发生时间**: 2026-03-13

## 原因分析

工作空间中包含了大量项目文件，导致所有文件都被自动加载到 AI 上下文中：

- projects/save-ancient-beauties/ - 1.2M (21个章节文件)
- fiction-studio/ - 532K (43个技能和文档文件)
- 总计约 1.7M 内容被加载

## 解决方案

创建了 .openclawignore 文件，排除大型项目目录。

## 效果

修复前: 204,281 tokens (超限)
修复后: 14,770 tokens (正常)
减少: 92.8%

## 当前配置

- contextWindow: 202,752 tokens
- maxTokens: 16,384 tokens
- 可用输入: ~186,000 tokens
- 注入文件: 7个核心配置文件

---

修复日期: 2026-03-13
