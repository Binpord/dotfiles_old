#############################
# Vadim Shiyanov Zshrc config
#############################

#
# Environment
#
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export KEYTIMEOUT=1
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/bin"
export ZSH_THEME="robbyrussell"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

#
# Plugins
#
export plugins=(zsh-autosuggestions vi-mode git zsh-syntax-highlighting)

#
# Oh-my-zsh
#
source $ZSH/oh-my-zsh.sh

#
# Extended glob
#
setopt extended_glob

#
# Aliases
#
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls="gls -alh --color --group-directories-first"
    alias ctags="$(brew --prefix)/bin/ctags"
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls="ls -alh --color --group-directories-first"
fi

alias l="ls"

#
# Sources
#
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh
