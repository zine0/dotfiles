if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source
starship init fish | source

alias cl clear
alias hx helix
alias ls 'eza -lh --group-directories-first --icons=auto'
alias lsa 'ls -a'
alias lt 'eza --tree --level=2 --long --icons --git'
alias lta 'lt -a'
alias ff "fzf --preview 'bat --style=numbers --color=always {}'"
alias cd "z"
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'


export GO111MODULE=auto


# pnpm
set -gx PNPM_HOME "/home/zine/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# uv
fish_add_path "/home/zine/.local/bin"
fish_add_path -g -p ~/flutter/bin

# go
fish_add_path "/home/zine/go/bin"

# cargo/bin
fish_add_path "/home/zine/.cargo/bin"
