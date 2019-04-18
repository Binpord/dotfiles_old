#############################
# Vadim Shiyanov Zshrc config
#############################

# Environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/sbin:$HOME/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
export KEYTIMEOUT=1
export XDG_CONFIG_HOME=$HOME/.config
export ZSH_THEME="robbyrussell"
export ZSH_TMUX_AUTOSTART=true

export plugins=(zsh-autosuggestions vi-mode tmux git)

source $ZSH/oh-my-zsh.sh
setopt extended_glob

if [[ "$(uname)" == "Darwin" ]]; then
    alias ls="gls -alh --color --group-directories-first"
    alias ctags="$(brew --prefix)/bin/ctags"
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls="ls -alh --color --group-directories-first"
fi

alias l="ls"
alias vim="nvim"
alias ..="cd .."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.custom.zsh ] && source ~/.custom.zsh

