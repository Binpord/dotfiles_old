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
export ZSH_THEME="robbyrussell"
if [[ -n "$SSH_TTY" ]]; then
    export ZSH_TMUX_AUTOSTART=true
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
export plugins=(zsh-autosuggestions tmux git zsh-syntax-highlighting)

#
# Oh-my-zsh
#
source $ZSH/oh-my-zsh.sh

#
# Aliases
#
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls="gls -alh --color --group-directories-first"
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls="ls -alh --color --group-directories-first"
fi

alias l="ls"

#
# Sources
#
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh

