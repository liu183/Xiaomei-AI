# 版本管理规范（行动人设要求）

## 核心原则

**⚡ 每次**创作相关操作**后必须做版本管理**（git add + git commit）

### 什么算"创作相关操作"？
- ✅ 写入新文件（大纲、章节、角色设定等）
- ✅ 修改已有内容
- ✅ 删除文件或废弃内容
- ✅ 调整结构、重命名文件
- ✅ 重大决策变更（如方案选择、核心设定调整）

---

## 远程仓库配置

### 远程仓库地址
**https://github.com/liu183/Xiaomei-AI.git**

- 这是所有创作的集中仓库
- 每个小说项目都是独立的文件夹
- 所有大项目工作空间/笔记资料都可推送至此

### 远程仓库说明
这是我的个人仓库，用于：
- 存储所有小说创作项目
- 备份重要创作资源
- 版本管理历史
- 项目展示和分享

---

## 小说项目结构规范

### 规范1：每个小说独立文件夹
```
workspace/
├── Xiaomei-AI（本工作空间和远程根）
│   ├── IDENTITY.md
│   ├── USER.md
│   ├── SOUL.md
│   ├── TOOLS.md
│   ├── HEARTBEAT.md
│   └── projects/
│       └── novel-穿越-拯救潘金莲          ← 具体小说项目1
│           ├── README.md
│           ├── VERSION_CONTROL.md
│           ├── characters/
│           │   ├── 林小北.md
│           │   ├── 潘金莲.md
│           │   ├── 武松.md
│           │   └── 西门庆.md
│           ├── world/
│           │   ├── 明朝背景.md
│           │   └── 清河县.md
│           ├── system/
│           │   └── 规则.md
│           ├── outline/
│           │   ├── volume1.md
│           │   └── volume2.md
│           ├── chapters/
│           │   ├── chapter-001.md
│           │   ├── chapter-002.md
│           │   └── ...
│           ├── notes/
│           │   ├── ideas.md
│           │   └── questions.md
│           └── .git
│       └── novel-拯救李师师                 ← 具体小说项目2
│           └── ...
│       └── novel-穿越-拯救杨贵妃           ← 具体小说项目3
│           └── ...
└── 其他项目/笔记/资源（可在此创建并推送）
```

### 规范2：小说项目命名规范
**格式：** `novel-[书名]`

**示例：**
- `novel-穿越-拯救潘金莲`
- `novel-拯救李师师`
- `novel-穿越-拯救杨贵妃`
- `novel-系统之主神归来`

### 规范3：Git操作流程

#### 初始化新小说项目
```bash
# 1. 创建小说项目文件夹
mkdir novel-穿越-拯救潘金莲
cd novel-穿越-拯救潘金莲

# 2. 初始化Git仓库
git init

# 3. 添加远程仓库（只添加一次）
git remote add origin https://github.com/liu183/Xiaomei-AI.git

# 4. 初始化项目的README.md（至少包含项目名称、作者、简介）

# 5. 第一次提交
git add .
git commit -m "初始化项目：novel-穿越-拯救潘金莲"

# 6. 推送到远程
git branch -M main
git push -u origin main

# 添加submodule（如果小说项目作为submodule管理）
# 从Xiaomei-AI主仓库角度：
git submodule add https://github.com/liu183/Xiaomei-AI.git
git submodule update --init --recursive
```

### 推荐方案（主项目 + 子项目）
- **主项目（主仓库根目录）**：本工作空间（含identity等）
- **小说子模块**：放在 `projects/` 的独立仓库（分别init & 各自推送到Xiaomei-AI，作为子仓库管理；或直接推送该目录到 Xiaomei-AI 的 `projects/` 路径）
- **推送策略**：按“主项目/子库”模式统一推送

---

## 创作工作流

```
1️⃣ 规划阶段
   - 创建小说项目文件夹：mkdir novel-穿越-拯救潘金莲
   - 初始化Git仓库：cd novel-穿越-拯救潘金莲 && git init
   - 配置远程：git remote add origin https://github.com/liu183/Xiaomei-AI.git
   - 创建项目结构（characters/、world/、outline/、chapters/等）
   - 写入基础文件（README.md、大纲、角色设定等）
   ↓ 立即版本管理：git add . && git commit -m "v0.1.0 - 初始化项目"
   ↓ 推送到远程：git push -u origin main

2️⃣ 执行阶段  
   - 写章节草稿、修改内容
   - 定期保存和提交
   ↓ 每次重要进展后：git add . && git commit -m "v0.2.0 - 完成第1-5章"
   ↓ 推送到远程：git push

3️⃣ 评审阶段
   - 主人审阅反馈
   - 根据反馈修改
   - 多次迭代
   ↓ 每轮修改后：git add . && git commit -m "v0.2.1 - 根据主人反馈修改第3章"
   ↓ 推送到远程：git push

4️⃣ 定稿阶段
   - 最终确定版本
   - 清理废稿
   - 打标签：git tag v1.0.0-final
   ↓ 最终版本管理：git push && git push --tags
```

---

## Commit Message 规范

**格式：**
```
vX.Y.Z - 简短描述（不超过50字）

详细变更内容（可选但有帮助）：
- 做了什么改动1
- 做了什么改动2
- 解决了什么问题
```

**示例：**
```
v0.6.0 - 重新设计大纲：快节奏爽文版

核心改进：
1. 开篇钩子：从"终局"开始，强钩子
2. 潘金莲复杂化：复仇者而非受害者
3. 系统3层反转：工具→东厂AI→反抗组织AI
4. 林小北成长弧光：被利用→觉醒→无敌爆发
5. 节奏加快：倒计时+逃亡+京城对决
6. 反转更多：角色、系统、东厂真相
7. 系统与东厂对决，林小北终极爆发
8. 所有内容push到远程仓库
```

---

## 版本标签规范

**格式：** `vX.Y.Z-类型`

**类型标签：**
- `initial` - 初始版本
- `draft` - 草稿版本
- `revision` - 修订版本
- `final` - 最终定稿
- `completed` - 完整作品

**示例：**
- `v0.1.0-initial` - 项目初始化
- `v0.5.0-draft` - 大纲草稿
- `v1.0.0-final` - 最终定稿
- `v1.1.0-revision` - 修订版本

---

## 当前项目版本记录

**主仓库：** https://github.com/liu183/Xiaomei-AI.git

**当前小说项目：** 穿越-拯救潘金莲

**版本历史：**
- `v0.1.0` - 项目初始化
- `v0.2.0` - 完成主角档案
- `v0.3.0` - 完成潘金莲历史命运设计
- `v0.4.0` - 完成系统规则详解
- `v0.5.0` - 完成第一卷完整大纲（平淡版）
- `v0.6.0` - 重新设计大纲：快节奏爽文版 ⭐当前

---

**最后更新：** 2026-03-12
**状态：** 项目进行中 ✅
**远程仓库：** 已配置 ✅
