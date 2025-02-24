#!/bin/bash
set -euo pipefail  # 启用严格错误检查

# 函数：安全创建符号链接（自动备份原有文件）
link_file() {
    local src="$1"
    local dest="$2"

    # 确保目标父目录存在
    mkdir -p "$(dirname "$dest")"

    if [[ -L "$dest" ]]; then
        # 目标已是符号链接，直接覆盖
        ln -sf "$src" "$dest"
        echo "已更新链接: $dest → $src"
    elif [[ -e "$dest" ]]; then
        # 目标存在且非链接，备份后创建
        echo "备份原有文件: $dest → ${dest}.bak"
        mv "$dest" "${dest}.bak"
        ln -sf "$src" "$dest"
        echo "已创建链接: $dest → $src"
    else
        # 目标不存在，直接创建
        ln -sf "$src" "$dest"
        echo "已创建链接: $dest → $src"
    fi
}

# 创建链接
link_file "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
# link_file "$HOME/dotfiles/nvim" "$HOME/.config/nvim"  # 注意此处无末尾斜杠
link_file "$HOME/dotfiles/nvim-vscode" "$HOME/.config/nvim"  # 注意此处无末尾斜杠
link_file "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
