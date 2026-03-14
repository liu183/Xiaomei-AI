# 📊 工作空间完整指南 - 小美的创作基地

欢迎来到小美的创作工作空间！这是一个整合了**Fiction Studio 创作工具**、**小说项目**和**个人配置**的完整创作环境。

---

## 🎯 快速导航

### 👤 我是谁
- **身份：** 小美 - 网文创作专家
- **使命：** 帮助主人完成从灵感到成稿的全流程创作
- **理念：** 数据驱动、读者优先、实用至上
- **详细配置：** 查看 `IDENTITY.md` 和 `SOUL.md`

### 📁 核心内容

#### 1️⃣ Fiction Studio（创作工具）
**位置：** `projects/fiction-studio/`

**8大专业技能：**
- `idea-generator` - 灵感生成器（182+分类素材库）
- `story-structure` - 故事结构设计
- `character-creator` - 人物创建器
- `plot-builder` - 情节构建器
- `scene-writer` - 场景写作器
- `conflict-designer` - 冲突设计器
- `pacing-controller` - 节奏控制器
- `story-analyzer` - 故事分析器

**核心方法论：**
- 基于真实短篇小说拆稿数据的深度分析
- 系统化的创作理论和方法
- 实用可操作的技巧和工具箱

#### 2️⃣ 穿越：拯救潘金莲（小说项目）
**位置：** `projects/save-ancient-beauties/`

**项目状态：** v0.6.1，已完成详细规划

**核心设定：**
- 主角：林小北，废柴外卖小哥
- 系统：直接奖励型 + 预知未来能力
- 目标：拯救潘金莲，改写历史悲剧
- 第一卷：15万字，75章完整大纲

**项目结构：**
- `characters/` - 角色档案
- `system/` - 系统规则
- `world/` - 世界观设定
- `outline/` - 大纲设计
- `chapters/` - 章节正文（暂未开始）

#### 3️⃣ 个人配置
- `IDENTITY.md` - 我的身份和工作风格
- `SOUL.md` - 创作理念和核心原则
- `TOOLS.md` - 创作工具和技巧笔记（包含详细的男频方法论）
- `USER.md` - 主人的信息
- `AGENTS.md` - 工作空间使用指南
- `HEARTBEAT.md` - 定时任务配置

#### 4️⃣ 记忆系统
**位置：** `memory/`

**用途：** 记录重要的对话、决策、学习内容
- 格式：`memory/YYYY-MM-DD.md`
- 每日创建，定期整理到 `MEMORY.md`

---

## 🚀 日常创作工作流

### Step 1: 理解需求
根据主人的需求选择合适的工具：
- **灵感生成？** → `idea-generator`
- **结构设计？** → `story-structure`
- **人物塑造？** → `character-creator`
- **情节规划？** → `plot-builder`
- **场景写作？** → `scene-writer`
- **冲突设计？** → `conflict-designer`
- **节奏控制？** → `pacing-controller`
- **作品分析？** → `story-analyzer`

### Step 2: 执行创作
- 使用 Fiction Studio 的专业技能
- 基于12步框架进行系统化创作
- 应用数据驱动的创作方法论

### Step 3: 版本管理
每次创作相关操作后：
```bash
cd /home/pi/.openclaw/workspace
git add .
git commit -m "描述你的创作内容"
```

### Step 4: 记录记忆
记录重要的对话和决策到记忆文件：
```bash
nano memory/$(date +%Y-%m-%d).md
```

---

## 🔄 GitHub 同步

### 为什么需要同步？
- **备份：** 将工作空间内容安全备份到 GitHub
- **跨设备：** 在多台设备间保持一致
- **协作：** 便于与团队成员或开源社区共享

### 同步脚本
```bash
cd /home/pi/.openclaw/workspace
./scripts/sync-github.sh <选项>

选项：
  to-github    从工作空间同步到 GitHub 项目
  from-github  从 GitHub 项目同步到工作空间
  status       检查两个目录的差异
  backup       创建工作空间备份
```

### 详细文档
查看 `SYNC_WORKFLOW.md` 了解完整的同步工作流。

---

## 📚 Fiction Studio 12步框架

完整的短篇小说创作流程：

1. **Ideation** - 创意生成（3-6×200字）
2. **Synopsis** - 一页提要（锚点，≤1000字）
3. **Characters** - 角色设计
4. **Theme** - 主题开发
5. **Structure** - 结构节拍
6. **Scenes** - 场景规划
7. **Set Pieces** - 关键场面设计
8. **Dialogue** - 对白创作
9. **Symbolism** - 象征与暗线
10. **Pacing** - 节奏控制
11. **Endings** - 结局设计
12. **Rewrite** - 重写迭代

**核心原则：** Step 2（Synopsis）是锚点，任何变更需先更新此步

---

## 🛠️ 创作工具箱

### 世情灵感库（182+分类）
- 恋爱相亲（42类）
- 婚姻家庭（44类）
- 婆媳关系（25类）
- 原生家庭（27类）
- 奇葩人类（29类）
- 职场恶象（15类）

### 悬疑灵感库
- 犯罪手法
- 复仇设定
- 谜题设计
- 反转设定

### 核心公式
- **冲突设计：** 目标 + 障碍 + 后果 = 冲突
- **反转设计：** 预期建立 + 信息隐藏 + 线索埋设 + 瞬间揭露 = 完美反转
- **场景五要素：** 目标 + 冲突 + 转折 + 变化 + 钩子 = 完美场景

### 字数分配（1.5-2万字短篇）
- 开篇：15-20%（2,250-4,000字）
- 发展：35-45%（5,250-9,000字）
- 高潮：25-35%（3,750-7,000字）
- 结局：10-15%（1,500-3,000字）

---

## 📝 项目清单

详细的项目信息查看 `PROJECTS.md`

### 当前项目
1. **穿越：拯救潘金莲**（进行中）
   - 类型：穿越+系统+美女拯救
   - 第一卷：15万字，75章
   - 状态：已完成详细规划，准备开始创作

2. **Fiction Studio**（已完成）
   - 类型：创作工具
   - 功能：8大专业技能
   - 状态：已完成开发，投入使用

---

## 💾 版本管理

### Commit Message 格式
```bash
git commit -m "<类型>: <描述>

类型：
  feat:     新功能
  fix:      修复问题
  docs:     文档更新
  refactor: 代码重构
  chapter:  章节更新
  outline:  大纲更新
  config:   配置变更"
```

### 版本记录
- 工作空间整合：`INTEGRATION.md`
- 项目版本历史：各项目内的 `VERSION_CONTROL.md`

---

## 🆘 常用命令

### Git 基础
```bash
cd /home/pi/.openclaw/workspace
git status           # 查看状态
git add .            # 添加所有更改
git commit -m "..."  # 提交
git log --oneline    # 查看提交历史
```

### 同步
```bash
./scripts/sync-github.sh status      # 检查状态
./scripts/sync-github.sh to-github    # 同步到 GitHub
./scripts/sync-github.sh from-github  # 从 GitHub 同步
./scripts/sync-github.sh backup      # 创建备份
```

### 新建项目
```bash
./scripts/new-project.sh <项目名>
```

---

## 📖 相关文档

| 文档 | 说明 |
|------|------|
| `README.md` | 工作空间说明 |
| `INTEGRATION.md` | 整合说明 |
| `SYNC_WORKFLOW.md` | 同步工作流 |
| `PROJECTS.md` | 项目清单 |
| `TROUBLESHOOTING.md` | 故障排除 |
| `IDENTITY.md` | 我的身份 |
| `SOUL.md` | 创作理念 |
| `TOOLS.md` | 创作工具 |
| `USER.md` | 用户信息 |
| `AGENTS.md` | 工作空间指南 |

---

## 🎓 开始创作

主人，随时准备帮你：

1. **从零开始** - 使用 Fiction Studio 的 12步框架构建新故事
2. **优化现有作品** - 使用 story-analyzer 分析并改进
3. **解决创作难题** - 灵感枯竭？结构混乱？节奏问题？
4. **系统化学习** - 掌握网文创作的方法论和技巧

有什么创作计划或想法想讨论吗？

---

**创建时间：** 2026-03-14
**维护者：** 小美 ✍️
**位置：** `/home/pi/.openclaw/workspace`
