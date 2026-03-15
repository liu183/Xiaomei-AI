# 快速开始指南

这是一个快速参考指南，帮助你快速上手本仓库。

## 🚀 5 分钟快速开始

### 1️⃣ 克隆仓库
```bash
cd ~/.openclaw/workspace
git clone https://github.com/liu183/Xiaomei-AI.git
cd Xiaomei-AI
```

### 2️⃣ 链接配置（一次性）
```bash
ln -sf $(pwd)/shared/*.md ~/.openclaw/workspace/
```

### 3️⃣ 开始创作
```bash
cd projects/save-ancient-beauties
openclaw agent --message "开始今天的创作工作"
```

---

## ➕ 添加新项目（3 分钟）

```bash
# 1. 创建项目
cd ~/workspace/Xiaomei-AI/projects
mkdir my-new-novel && cd my-new-novel

# 2. 初始化结构
mkdir -p chapters characters outline notes world
cp ../../shared/templates/*.md ./

# 3. 创建 README
cat > README.md << 'EOF'
# 我的小说

> 小说描述

## 项目信息
- **类型**: 小说
- **状态**: 进行中
EOF

# 4. 更新项目清单
cd ../..
# 编辑 PROJECTS.md 添加新项目

# 5. 提交
git add .
git commit -m "feat: Add new project - my-new-novel"
git push origin main
```

---

## 📝 常用命令

### 日常创作
```bash
# 在项目中工作
cd projects/your-project

# 使用 AI 助手
openclaw agent --message "帮我设计角色"

# 提交工作
git add .
git commit -m "update: 添加新章节"
git push origin main
```

### 查看项目
```bash
# 查看所有项目
cat PROJECTS.md

# 查看项目结构
ls -la projects/

# 查看项目详情
cat projects/your-project/README.md
```

### 使用模板
```bash
# 复制角色模板
cp shared/templates/character-profile.md projects/your-project/characters/

# 复制大纲模板
cp shared/templates/outline-template.md projects/your-project/outline/
```

---

## 🎯 项目结构速查

```
Xiaomei-AI/
├── projects/              # 你的项目
│   ├── project-a/        # 项目 A
│   └── project-b/        # 项目 B
├── shared/               # 共享资源
│   ├── templates/        # 写作模板
│   ├── skills/           # AI 技能
│   └── docs/             # 参考文档
├── PROJECTS.md           # 项目清单
└── README.md             # 仓库说明
```

---

## 💡 快速提示

- ✅ **项目命名**: 使用小写和连字符（`my-novel`）
- ✅ **定期提交**: 每完成一个章节就提交
- ✅ **使用模板**: 不要重复造轮子
- ✅ **查看文档**: 遇到问题看 [SETUP.md](SETUP.md)

---

## 🆘 遇到问题？

1. **配置问题** → 查看 [SETUP.md](SETUP.md)
2. **项目问题** → 查看项目 README
3. **共享资源** → 查看 [shared/README.md](shared/README.md)
4. **项目清单** → 查看 [PROJECTS.md](PROJECTS.md)

---

*需要详细说明？请查看 [SETUP.md](SETUP.md)*
