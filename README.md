# Xiaomei-AI 写作项目仓库

> 单仓库多项目管理 - 专注于小说创作和写作工具开发

## 📖 关于本仓库

本仓库采用**单仓库多项目**的管理结构，用于管理多个写作项目及相关工具。

- **主要类型**: 小说创作、写作工具、辅助资源
- **管理方式**: 每个项目独立管理，共享资源统一维护
- **版本控制**: Git + 单一主分支

## 🚀 快速开始

### 浏览项目
查看 [项目清单](PROJECTS.md) 了解所有项目。

### 开始工作
```bash
# 克隆仓库
git clone https://github.com/liu183/Xiaomei-AI.git
cd Xiaomei-AI

# 进入特定项目
cd projects/save-ancient-beauties

# 查看项目说明
cat README.md
```

### 添加新项目
参考 [项目清单](PROJECTS.md) 中的"添加新项目"章节。

## 📁 仓库结构

```
Xiaomei-AI/
├── projects/              # 所有写作项目
│   ├── save-ancient-beauties/    # 金瓶梅项目
│   └── fiction-studio/           # 创作工具（待迁移）
├── shared/                # 共享资源
│   ├── templates/         # 写作模板
│   ├── assets/            # 共享素材
│   ├── docs/              # 共享文档
│   └── skills/            # OpenClaw 技能
├── PROJECTS.md            # 项目清单
├── README.md              # 本文件
└── .gitignore             # Git 忽略规则
```

## 📚 当前项目

### 1. 拯救古代美女系统（金瓶梅）
- **路径**: `projects/save-ancient-beauties/`
- **类型**: 古典小说改编/穿越系统文
- **状态**: 进行中
- **描述**: 基于《金瓶梅》的历史穿越小说创作

### 2. fiction-studio（小说创作工具）
- **路径**: 待迁移
- **类型**: 写作辅助工具
- **状态**: 规划中

## 🔧 工作流

### 日常开发
```bash
# 1. 更新本地仓库
git pull origin main

# 2. 进入项目目录
cd projects/your-project

# 3. 进行创作/编辑
# ...

# 4. 提交更改
git add .
git commit -m "描述你的更改"
git push origin main
```

### 版本管理
遵循语义化版本控制，详见各项目内的 `VERSION_CONTROL.md`。

## 🤝 贡献指南

本仓库主要用于个人创作，暂不对外开放贡献。

## 📄 许可证

各项目可能采用不同的许可证，详见各项目目录。

---

**最后更新**: 2026-03-13
**维护者**: @liu183
