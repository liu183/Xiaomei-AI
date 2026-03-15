# 仓库配置指南

本文档说明如何配置本仓库以使用 OpenClaw 和共享资源，以及如何添加新项目。

## 📋 目录

- [初始配置](#初始配置)
- [添加新项目](#添加新项目)
- [日常使用](#日常使用)
- [相关文档](#相关文档)

---

## 🔧 初始配置

### 1. 克隆仓库到 OpenClaw 工作空间

```bash
# 在树莓派或本地机器上
cd ~/.openclaw/workspace
git clone https://github.com/liu183/Xiaomei-AI.git
```

### 2. 链接共享配置到工作空间根目录

```bash
cd ~/.openclaw/workspace/Xiaomei-AI
ln -sf $(pwd)/shared/SOUL.md ~/.openclaw/workspace/
ln -sf $(pwd)/shared/IDENTITY.md ~/.openclaw/workspace/
ln -sf $(pwd)/shared/USER.md ~/.openclaw/workspace/
ln -sf $(pwd)/shared/HEARTBEAT.md ~/.openclaw/workspace/
ln -sf $(pwd)/shared/AGENTS.md ~/.openclaw/workspace/
ln -sf $(pwd)/shared/TOOLS.md ~/.openclaw/workspace/
```

### 3. 验证配置

```bash
ls -la ~/.openclaw/workspace/*.md
# 应该看到所有配置文件
```

---

## ➕ 添加新项目

### 步骤 1: 创建项目目录

```bash
cd ~/.openclaw/workspace/Xiaomei-AI/projects

# 创建新项目目录（使用小写和连字符）
mkdir your-new-project

# 进入项目目录
cd your-new-project
```

### 步骤 2: 初始化项目结构

```bash
# 使用模板创建基础结构
cp ../../shared/templates/character-profile.md ./character-profile-template.md
cp ../../shared/templates/outline-template.md ./outline-template.md

# 创建项目子目录
mkdir -p chapters           # 章节内容
mkdir -p characters         # 角色档案
mkdir -p outline            # 大纲设计
mkdir -p notes              # 创作笔记
mkdir -p world              # 世界观设定
mkdir -p system             # 系统/机制设定（如适用）
```

### 步骤 3: 创建项目 README.md

```bash
cat > README.md << 'EOF'
# 你的项目名称

> 项目简短描述

## 📖 项目信息

- **类型**: [小说/剧本/其他]
- **题材**: [题材类型]
- **预计字数**: [预计字数]
- **状态**: [规划中/进行中/已完成]

## 🎯 核心设定

### 核心梗
[一句话描述核心创意]

### 主角
[主角基本信息]

### 世界观
[世界观设定]

## 📂 项目结构

```
your-new-project/
├── README.md              # 项目说明（本文件）
├── chapters/              # 章节内容
├── characters/            # 角色档案
├── outline/               # 大纲设计
├── notes/                 # 创作笔记
├── world/                 # 世界观设定
└── system/                # 系统/机制设定
```

## 📝 版本记录

### v0.1.0 - 项目初始化 (日期)
- ✅ 创建项目结构
- ✅ 初始化 Git 版本管理

---

**项目状态**: [初始化/规划/创作中] 🚀
EOF
```

### 步骤 4: 创建 .gitignore（可选）

```bash
cat > .gitignore << 'EOF'
# 项目特定忽略规则

# 文档草稿
*.txt
*.doc
*.docx

# 章节草稿
chapters/drafts/

# 临时笔记
notes/temp/
EOF
```

### 步骤 5: 更新项目清单

编辑仓库根目录的 `PROJECTS.md`，添加新项目信息：

```bash
cd ../..
# 编辑 PROJECTS.md，在项目列表中添加：

### N. your-new-project（项目名称）
- **路径**: `projects/your-new-project/`
- **类型**: [项目类型]
- **状态**: [项目状态]
- **描述**: [项目描述]
- **最后更新**: YYYY-MM-DD
```

### 步骤 6: 提交并推送

```bash
# 添加所有新文件
git add .

# 提交
git commit -m "feat: Add new project - your-new-project

- Initialize project structure
- Add README and basic documentation
- Set up project directories"

# 推送到 GitHub
git push origin main
```

### 步骤 7: 配置 OpenClaw 识别新项目

```bash
# 方式 1: 使用 session-id
openclaw agent --session-id "your-project-session" --message "开始分析你的新项目"

# 方式 2: 在项目目录中启动
cd projects/your-new-project
openclaw agent --message "我正在创作这个项目，帮我分析现有结构"
```

---

## 🚀 日常使用

### 在项目中工作

```bash
# 进入项目目录
cd ~/.openclaw/workspace/Xiaomei-AI/projects/your-project

# 使用 OpenClaw 进行创作
openclaw agent --session-id "project-work" --message "帮我设计第三章大纲"
```

### 提交工作成果

```bash
# 查看更改
git status

# 添加修改的文件
git add chapters/ new-chapter.md

# 提交
git commit -m "feat: Add chapter 3 - 章节标题

- 完成第三章初稿
- 添加主要对话和场景"

# 推送
git push origin main
```

### 切换项目

```bash
# 返回仓库根目录
cd ~/.openclaw/workspace/Xiaomei-AI

# 进入另一个项目
cd projects/another-project
```

---

## 🔄 更新配置

当共享资源更新时，重新执行初始配置的步骤 2。

---

## 📚 相关文档

- [项目清单](PROJECTS.md) - 查看所有项目
- [共享资源](shared/README.md) - 查看共享资源
- [各项目 README](projects/) - 查看具体项目文档

---

## 💡 提示

1. **项目命名**: 使用小写字母和连字符，如 `my-great-novel`
2. **定期提交**: 每完成一个章节或重要修改就提交
3. **使用模板**: 充分利用 `shared/templates/` 中的模板
4. **共享资源**: 通用的设定和素材放在 `shared/` 目录
5. **版本控制**: 重要的里程碑和决策都记录在 commit message 中

---

*最后更新: 2026-03-13*
