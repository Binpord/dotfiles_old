#############################
# Vadim Shiyanov Zshrc config
#############################

# Environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/sbin:$HOME/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'
export KEYTIMEOUT=1
export XDG_CONFIG_HOME=$HOME/.config
export ZSH_THEME="robbyrussell"

export plugins=(zsh-autosuggestions vi-mode)

source $ZSH/oh-my-zsh.sh
setopt extended_glob

alias ls='ls -alh --color --group-directories-first'
alias l='ls'

alias vim='nvim'

alias ..='cd ..'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

