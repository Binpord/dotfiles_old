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
export ZSH_THEME="robbyrussell"
export ZSH_TMUX_AUTOSTART=true
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    export ZSH_TMUX_ITERM2=true
fi

#
# Tmux ssh agent forwarding fix
#
SOCK="$HOME/.ssh/ssh-agent-socket"
if [[ -a "$SSH_AUTH_SOCK" && "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
    ln -sf $SSH_AUTH_SOCK $SOCK
fi
export SSH_AUTH_SOCK=$SOCK

#
# Plugins
#
plugins=(zsh-autosuggestions vi-mode tmux git zsh-syntax-highlighting)
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    # Remove tmux from plugins
    plugins[$plugins[(i)tmux]]=()
fi
export plugins

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
