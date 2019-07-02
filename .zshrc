#############################
# Vadim Shiyanov Zshrc config
#############################

#
# Environment
#
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="$HOME/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export KEYTIMEOUT=1
export DISABLE_AUTO_TITLE=true
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_THEME="robbyrussell"
export ZSH_TMUX_AUTOSTART=true
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    export ZSH_TMUX_ITERM2=true
fi

#
# Plugins
#
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    export plugins=(zsh-autosuggestions vi-mode)
else
    export plugins=(zsh-autosuggestions vi-mode tmux git)
fi

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
alias ssh="TERM=xterm-256color ssh"

#
# Sources
#
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh
