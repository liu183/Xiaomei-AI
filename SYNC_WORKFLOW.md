# 同步工作流指南

本文档说明如何使用同步脚本在本地工作空间和 GitHub 项目之间保持同步。

## 快速开始

### 查看同步状态
```bash
cd /home/pi/.openclaw/workspace
./scripts/sync-github.sh status
```

### 从 GitHub 项目同步到工作空间
```bash
./scripts/sync-github.sh from-github
```

### 从工作空间同步到 GitHub 项目
```bash
./scripts/sync-github.sh to-github
```

### 创建备份
```bash
./scripts/sync-github.sh backup
```

---

## 日常工作流

### 场景 1: 在工作空间进行创作

1. **创作内容**
   - 在工作空间进行日常创作、修改
   - 工作空间位置：`/home/pi/.openclaw/workspace`

2. **提交到 Git**
   ```bash
   cd /home/pi/.openclaw/workspace
   git add .
   git commit -m "描述你的创作内容"
   ```

3. **定期同步到 GitHub 项目**
   ```bash
   ./scripts/sync-github.sh to-github
   ```
   然后进入 GitHub 项目目录提交：
   ```bash
   cd /home/pi/Xiaomei-AI
   git add .
   git commit -m "从工作空间同步"
   git push origin main
   ```

### 场景 2: 在 GitHub 项目进行修改

1. **在 GitHub 修改**
   - 直接修改 GitHub 仓库文件
   - 拉取更新到本地：
     ```bash
     cd /home/pi/Xiaomei-AI
     git pull origin main
     ```

2. **同步到工作空间**
   ```bash
   cd /home/pi/.openclaw/workspace
   ./scripts/sync-github.sh from-github
   ```

3. **提交到工作空间 Git**
   ```bash
   git add .
   git commit -m "从 GitHub 项目同步"
   ```

### 场景 3: 双向同步（处理冲突）

如果两个位置都有修改：

1. **创建备份**
   ```bash
   ./scripts/sync-github.sh backup
   ```

2. **检查差异**
   ```bash
   ./scripts/sync-github.sh status
   ```

3. **手动处理冲突**
   - 查看差异的文件
   - 决定保留哪个版本或合并两者
   - 手动编辑文件解决冲突

4. **选择同步方向**
   - 如果工作空间的更改更重要：运行 `to-github`
   - 如果 GitHub 项目的更改更重要：运行 `from-github`

---

## 同步规则

### 自动同步的内容

✅ **会同步的文件和目录：**
- `projects/*` - 所有项目内容
- `IDENTITY.md` - 身份配置
- `SOUL.md` - 创作理念
- `TOOLS.md` - 创作工具
- `USER.md` - 用户信息
- `AGENTS.md` - 工作空间指南
- `HEARTBEAT.md` - 心跳任务
- `assets/*` - 素材库
- `docs/*` - 共享文档
- `skills/*` - OpenClaw 技能
- `templates/*` - 写作模板

### 不会覆盖的内容

❌ **不会被覆盖的文件和目录：**
- `memory/*` - **记忆目录（重要！）**
  - 包含用户的个人记忆和上下文
  - 每次同步都会跳过
  - 只在工作空间中维护

- `.git/*` - Git 仓库目录
  - 每个位置有自己的 Git 仓库
  - 不会跨仓库同步

---

## 最佳实践

### 1. 定期备份
在执行任何同步操作前，先创建备份：
```bash
./scripts/sync-github.sh backup
```

### 2. 频繁同步
建议每天进行一次同步，避免差异积累太多：
```bash
# 早上创作结束后
./scripts/sync-github.sh to-github
```

### 3. 明确同步方向
- **工作空间 → GitHub 项目**：当你想推送本地创作时
- **GitHub 项目 ← 工作空间**：当你想拉取更新时

### 4. 提交前检查
同步后，记得检查更改是否符合预期：
```bash
cd /home/pi/.openclaw/workspace
git status
git diff
```

### 5. 清晰的 Commit Message
每次提交都使用清晰的描述：
```bash
git commit -m "《穿越：拯救潘金莲》完成第5章：潘金莲的秘密"
```

---

## 故障排除

### 问题 1: 同步后被覆盖了重要更改
**解决方法：**
1. 找到最近的备份文件：
   ```bash
   ls -lh /home/pi/.openclaw/workspace_backup_*.tar.gz
   ```
2. 解压备份：
   ```bash
   cd /home/pi/.openclaw
   tar -xzf workspace_backup_YYYYMMDD_HHMMSS.tar.gz
   ```

### 问题 2: 权限错误
**解决方法：**
```bash
chmod +x /home/pi/.openclaw/workspace/scripts/sync-github.sh
```

### 问题 3: 内存目录没有同步
**说明：** 这是正常行为，`memory/` 目录不会在两个位置之间同步，只在工作空间中维护。

---

## 同步策略选择

### 推荐策略：工作空间为主

**适用场景：**
- 主要在工作空间进行创作
- GitHub 项目作为备份和远程协作

**工作流：**
1. 工作空间创作
2. 提交到工作空间 Git
3. 同步到 GitHub 项目
4. 推送到 GitHub 远程仓库

### 备选策略：GitHub 项目为主

**适用场景：**
- 主要在 GitHub 网页上修改
- 工作空间作为本地开发环境

**工作流：**
1. GitHub 网页修改
2. 拉取更新到本地 GitHub 项目
3. 同步到工作空间
4. 在工作空间中使用

---

## 技术细节

### 同步脚本路径
- `/home/pi/.openclaw/workspace/scripts/sync-github.sh`

### 目录映射
| 工作空间 | GitHub 项目 |
|---------|------------|
| `~/workspace/projects/` | `~/Xiaomei-AI/projects/` |
| `~/workspace/IDENTITY.md` | `~/Xiaomei-AI/shared/IDENTITY.md` |
| `~/workspace/SOUL.md` | `~/Xiaomei-AI/shared/SOUL.md` |
| `~//workspace/TOOLS.md` | `~/Xiaomei-AI/shared/TOOLS.md` |
| `~/workspace/memory/` | **不同步** |

### 备份位置
- `/home/pi/.openclaw/workspace_backup_YYYYMMDD_HHMMSS.tar.gz`

---

**文档版本：** 1.0.0
**创建日期：** 2026-03-14
**维护者：** 小美（网文创作专家）
