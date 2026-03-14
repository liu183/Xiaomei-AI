#!/bin/bash

# 同步脚本：在本地工作空间和 GitHub 项目之间同步
# 用途：保持 /home/pi/.openclaw/workspace 和 /home/pi/Xiaomei-AI 的内容同步

set -e  # 遇到错误立即退出

# 配置
WORKSPACE="/home/pi/.openclaw/workspace"
GITHUB_REPO="/home/pi/Xiaomei-AI"
BACKUP_DIR="/home/pi/.openclaw"
DATE=$(date +%Y%m%d_%H%M%S)

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印函数
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# 帮助信息
show_help() {
    cat << EOF
同步脚本 - 在本地工作空间和 GitHub 项目之间同步

用法：
    $0 [选项]

选项：
    to-github    从工作空间同步到 GitHub 项目
    from-github  从 GitHub 项目同步到工作空间
    status       检查两个目录的差异
    backup       创建工作空间备份

示例：
    $0 to-github      # 将工作空间的更改推送到 GitHub 项目
    $0 from-github    # 从 GitHub 项目拉取更新到工作空间
    $0 status         # 查看差异状态
    $0 backup         # 创建备份

重要说明：
    - 此操作会覆盖目标目录中的相同文件
    - 敏感文件（memory/）会保留，不会被覆盖
    - 建议在同步前先执行备份
EOF
}

# 创建备份
do_backup() {
    print_info "创建工作空间备份..."
    cd "$BACKUP_DIR"
    tar -czf "workspace_backup_${DATE}.tar.gz" workspace
    print_success "备份已创建: workspace_backup_${DATE}.tar.gz"
}

# 同步到 GitHub 项目
sync_to_github() {
    print_info "开始同步: 工作空间 → GitHub 项目"

    # 先创建备份
    do_backup

    # 确认提示
    print_warning "即将从工作空间复制文件到以下目录:"
    echo "  $GITHUB_REPO"
    echo ""
    read -p "确认继续? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "已取消同步"
        exit 0
    fi

    print_info "复制项目文件..."
    rm -rf "$GITHUB_REPO/projects"/*
    cp -r "$WORKSPACE/projects"/* "$GITHUB_REPO/projects/"

    print_info "复制配置文件..."
    cp "$WORKSPACE/IDENTITY.md" "$GITHUB_REPO/shared/IDENTITY.md"
    cp "$WORKSPACE/SOUL.md" "$GITHUB_REPO/shared/SOUL.md"
    cp "$WORKSPACE/TOOLS.md" "$GITHUB_REPO/shared/TOOLS.md"
    cp "$WORKSPACE/USER.md" "$GITHUB_REPO/shared/USER.md"
    cp "$WORKSPACE/AGENTS.md" "$GITHUB_REPO/shared/AGENTS.md"
    cp "$WORKSPACE/HEARTBEAT.md" "$GITHUB_REPO/shared/HEARTBEAT.md"

    # 复制共享资源
    print_info "复制共享资源..."
    cp -r "$WORKSPACE/assets/"* "$GITHUB_REPO/shared/assets/" 2>/dev/null || true
    cp -r "$WORKSPACE/docs/"* "$GITHUB_REPO/shared/docs/" 2>/dev/null || true
    cp -r "$WORKSPACE/skills/"* "$GITHUB_REPO/shared/skills/" 2>/dev/null || true
    cp -r "$WORKSPACE/templates/"* "$GITHUB_REPO/shared/templates/" 2>/dev/null || true

    print_success "同步完成！"
    print_info "请检查 $GITHUB_REPO 中的更改，然后使用 git 提交"
}

# 从 GitHub 项目同步
sync_from_github() {
    print_info "开始同步: GitHub 项目 → 工作空间"

    # 先创建备份
    do_backup

    # 确认提示
    print_warning "即将从以下目录复制文件到工作空间:"
    echo "  $GITHUB_REPO"
    echo ""
    read -p "确认继续? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "已取消同步"
        exit 0
    fi

    # 复制项目文件
    print_info "复制项目文件..."
    rm -rf "$WORKSPACE/projects"/*
    mkdir -p "$WORKSPACE/projects"
    cp -r "$GITHUB_REPO/projects"/* "$WORKSPACE/projects/"

    # 复制配置文件（覆盖现有文件）
    print_info "更新配置文件..."
    cp "$GITHUB_REPO/shared/IDENTITY.md" "$WORKSPACE/IDENTITY.md"
    cp "$GITHUB_REPO/shared/SOUL.md" "$WORKSPACE/SOUL.md"
    cp "$GITHUB_REPO/shared/TOOLS.md" "$WORKSPACE/TOOLS.md"
    cp "$GITHUB_REPO/shared/USER.md" "$WORKSPACE/USER.md"
    cp "$GITHUB_REPO/shared/AGENTS.md" "$WORKSPACE/AGENTS.md"
    cp "$GITHUB_REPO/shared/HEARTBEAT.md" "$WORKSPACE/HEARTBEAT.md"

    # 复制共享资源
    print_info "复制共享资源..."
    mkdir -p "$WORKSPACE/assets"
    cp -r "$GITHUB_REPO/shared/assets/"* "$WORKSPACE/assets/" 2>/dev/null || true

    mkdir -p "$WORKSPACE/docs"
    cp -r "$GITHUB_REPO/shared/docs/"* "$WORKSPACE/docs/" 2>/dev/null || true

    mkdir -p "$WORKSPACE/skills"
    cp -r "$GITHUB_REPO/shared/skills/"* "$WORKSPACE/skills/" 2>/dev/null || true

    mkdir -p "$WORKSPACE/templates"
    cp -r "$GITHUB_REPO/shared/templates/"* "$WORKSPACE/templates/" 2>/dev/null || true

    # 更新项目说明文件
    cp "$GITHUB_REPO/README.md" "$WORKSPACE/README_XIAOMEI-AI.md"
    cp "$GITHUB_REPO/PROJECTS.md" "$WORKSPACE/PROJECTS.md"

    # 注意：不覆盖 memory/ 目录（保留用户的记忆）

    print_success "同步完成！"
    print_info "请检查工作空间中的更改，然后提交到 Git"
}

# 检查差异
check_status() {
    print_info "检查工作空间和 GitHub 项目的差异..."
    echo ""

    # 检查项目目录
    print_info "项目对比:"
    echo "  工作空间项目:"
    ls "$WORKSPACE/projects/" 2>/dev/null || echo "    (无项目)"
    echo "  GitHub 项目:"
    ls "$GITHUB_REPO/projects/" 2>/dev/null || echo "    (无项目)"
    echo ""

    # 检查配置文件
    print_info "配置文件对比:"
    for file in IDENTITY.md SOUL.md TOOLS.md USER.md AGENTS.md HEARTBEAT.md; do
        if cmp -s "$WORKSPACE/$file" "$GITHUB_REPO/shared/$file" 2>/dev/null; then
            echo "  $file: 相同"
        else
            echo -e "  $file: ${YELLOW}不同${NC}"
        fi
    done
    echo ""

    # Git 状态
    print_info "工作空间 Git 状态:"
    cd "$WORKSPACE"
    git status --short

    print_info "GitHub 项目 Git 状态:"
    cd "$GITHUB_REPO"
    git status --short
}

# 主函数
main() {
    case "${1:-}" in
        to-github)
            sync_to_github
            ;;
        from-github)
            sync_from_github
            ;;
        status)
            check_status
            ;;
        backup)
            do_backup
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
}

# 执行
main "$@"
