if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl clear
alias hx helix
alias ls lsd

export GO111MODULE=auto

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/zine/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
