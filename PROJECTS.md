# 项目清单

本仓库管理多个写作项目，每个项目在 `projects/` 目录下独立管理。

## 📚 项目列表

### 1. save-ancient-beauties（金瓶梅）
- **路径**: `projects/save-ancient-beauties/`
- **类型**: 古典小说改编/创作
- **状态**: 进行中
- **描述**: 金瓶梅相关的创作项目
- **最后更新**: 2026-03-13

### 2. fiction-studio（小说创作工具）
- **路径**: `projects/fiction-studio/`
- **类型**: 工具/平台
- **状态**: 已完成
- **描述**: 基于真实拆稿数据的AI短篇小说创作系统
- **功能**: 8大创作技能（灵感生成、结构设计、情节构建、角色创建等）
- **最后更新**: 2026-03-13

## 🔄 添加新项目

```bash
# 1. 创建新项目目录
mkdir -p projects/your-project-name

# 2. 添加项目描述到这个文件
# 按照上面的格式添加项目信息

# 3. 提交更改
git add .
git commit -m "Add new project: your-project-name"
git push origin main
```

## 📁 目录结构

```
Xiaomei-AI/
├── projects/              # 所有项目
│   ├── save-ancient-beauties/
│   ├── fiction-studio/
│   └── [future-projects]/
├── shared/                # 共享资源
│   ├── templates/         # 写作模板
│   ├── assets/            # 共享素材
│   ├── docs/              # 共享文档
│   └── skills/            # OpenClaw 技能
├── PROJECTS.md            # 本文件
├── README.md              # 仓库总览
└── VERSION_CONTROL.md     # 版本控制指南
```

## 📝 项目命名规范

- 使用小写字母
- 使用连字符分隔单词
- 使用描述性的英文名称
- 例如: `my-great-novel`, `writing-tools`

## 🔗 项目间协作

如果需要在不同项目间共享资源，请使用 `shared/` 目录而不是直接复制文件。
