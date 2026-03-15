#!/bin/bash
# 新项目创建脚本
# 使用方法: ./new-project.sh project-name "项目描述"

set -e

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# 检查参数
if [ -z "$1" ]; then
    echo "❌ 错误: 请提供项目名称"
    echo "用法: ./new-project.sh project-name \"项目描述\""
    exit 1
fi

PROJECT_NAME=$1
PROJECT_DESC=${2:-"新写作项目"}
REPO_ROOT=$(cd "$(dirname "$0")/../.." && pwd)

echo -e "${BLUE}=== 创建新项目: ${PROJECT_NAME} ===${NC}"

# 创建项目目录
echo -e "${GREEN}✓${NC} 创建项目目录..."
PROJECT_DIR="${REPO_ROOT}/projects/${PROJECT_NAME}"
mkdir -p "${PROJECT_DIR}"

# 创建子目录
echo -e "${GREEN}✓${NC} 创建项目结构..."
cd "${PROJECT_DIR}"
mkdir -p chapters characters outline notes world system

# 复制模板
echo -e "${GREEN}✓${NC} 复制模板文件..."
cp "${REPO_ROOT}/shared/templates/character-profile.md" ./character-profile-template.md
cp "${REPO_ROOT}/shared/templates/outline-template.md" ./outline-template.md

# 创建 README
echo -e "${GREEN}✓${NC} 创建 README.md..."
cat > README.md << READMEEOF
# ${PROJECT_NAME}

> ${PROJECT_DESC}

## 📖 项目信息

- **类型**: 小说
- **题材**: 待定
- **预计字数**: 待定
- **状态**: 规划中

## 🎯 核心设定

### 核心梗
[一句话描述核心创意]

### 主角
[主角基本信息]

### 世界观
[世界观设定]

## 📝 版本记录

### v0.1.0 - 项目初始化 ($(date +%Y-%m-%d))
- ✅ 创建项目结构
- ✅ 初始化 Git 版本管理

---

**项目状态**: 规划中 🚀
READMEEOF

# 创建 .gitignore
echo -e "${GREEN}✓${NC} 创建 .gitignore..."
cat > .gitignore << GITIGNOREEOF
# 项目特定忽略规则
*.txt
*.doc
*.docx
chapters/drafts/
notes/temp/
GITIGNOREEOF

# 创建占位文件
touch chapters/.gitkeep
touch characters/.gitkeep
touch outline/.gitkeep
touch notes/.gitkeep
touch world/.gitkeep
touch system/.gitkeep

echo ""
echo -e "${BLUE}=== 项目创建完成！===${NC}"
echo ""
echo "📝 下一步操作:"
echo "1. 编辑 ${REPO_ROOT}/PROJECTS.md 添加项目信息"
echo "2. 提交: git add projects/${PROJECT_NAME}/"
echo "3. 提交: git commit -m 'feat: Add new project - ${PROJECT_NAME}'"
echo "4. 推送: git push origin main"
echo ""
echo -e "${GREEN}✅ 项目目录: ${PROJECT_DIR}${NC}"
