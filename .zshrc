#
# Variable set
#
export PATH=$HOME/bin:$PATH
export ZSH=/home/vadim/.oh-my-zsh
export EDITOR='vim'
export KEYTIMEOUT=1

#
# General settings
#
ZSH_THEME="blinks"
setopt extended_glob

#
# plugin configuration
#

# tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=true

plugins=(git dnf systemd tmux vi-mode)

source $ZSH/oh-my-zsh.sh

#
# snippets (aliases, colors etc.)
#
for file in $HOME/.zshrc.d/*; do
	if [[ -r $file ]]; then
		source $file
	fi
done
