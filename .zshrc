#
# Variable set
#
export PATH=$HOME/miniconda3/bin:$HOME/bin:$PATH
export ZSH=/Users/vadim/.oh-my-zsh
export EDITOR='vim'
export KEYTIMEOUT=1

#
# General settings
#
ZSH_THEME="robbyrussell"
setopt extended_glob

#
# plugin configuration
#
plugins=(git zsh-autosuggestions vi-mode)

source $ZSH/oh-my-zsh.sh

#
# snippets (aliases, colors etc.)
#
for file in $HOME/.zshrc.d/*; do
	if [[ -r $file ]]; then
		source $file
	fi
done

#
# system-specific options
# stored in .zshrc-Darwin.d for MacOS
#
if [[ -d $HOME/.zshrc-$(uname).d ]]; then
    for file in $HOME/.zshrc-$(uname).d/*; do
        if [[ -r $file ]]; then
            source $file
        fi
    done
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

