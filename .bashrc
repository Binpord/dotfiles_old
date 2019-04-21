##############################
# Vadim Shiyanov Bashrc config
##############################

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# tmux on every shell login
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

alias mc='. /usr/libexec/mc/mc-wrapper.sh'
alias vim='vimx'
alias ls='ls -alh --color --group-directories-first'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
