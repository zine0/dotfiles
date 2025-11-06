typeset -U path

# 环境变量
export GO111MODULE=auto

# pnpm
export PNPM_HOME="/home/zine/.local/share/pnpm"
path=($PNPM_HOME $path)


# go
path=(/usr/local/go/bin $path)

# cargo/bin (通常通过 ~/.cargo/env 设置)
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# flutter
path=($HOME/flutter/bin $path)

# 确保本地 bin 目录在路径中
path=($HOME/.local/bin $path)

# gpg agent to replace ssh agent
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
