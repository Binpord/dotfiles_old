# ===========================================
#           
#           ZSH run commands
#           place to $HOME/.zshrc
#
# ===========================================

SourceDirectory() {
    dir=$1
    for file in $dir/*.zsh; do
        source $file
    done
}

SourceDirectory $HOME/.zsh/plugins
SourceDirectory $HOME/.zsh/general
SourceDirectory $HOME/.zsh/$(uname)
SourceDirectory $HOME/.zsh/custom

