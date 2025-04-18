if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/miniconda3/bin/:$PATH
export TERMINFO=/usr/share/terminfo
export EDITOR=nvim
ZSH_THEME="powerlevel10k/powerlevel10k"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=$ZSH_CUSTOM/plugins/conda-zsh-completion

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
#   
source $ZSH/oh-my-zsh.sh



alias cl="clear"
alias ls="lsd"
alias hx="helix"

export TERM="xterm-256color"
export FZF_COMPLETION_TRIGGER='**'
source <(fzf --zsh)
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export GOPATH=/home/zine/go
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

export LANG=zh_CN.UTF-8
export LC_CTYPE="zh_CN.UTF-8"
 
unset SUDO_UID SUDO_GID SUDO_USER

