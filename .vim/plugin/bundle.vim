"--------------------------------------------
" vundle plugin manager part
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
" git support
Plugin 'tpope/vim-fugitive'
" listing a directory tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" cool status line
Plugin 'bling/vim-airline'
" themes for status line
Plugin 'vim-airline/vim-airline-themes'
" syntax check
Plugin 'scrooloose/syntastic'
" gruvbox colorscheme
Plugin 'morhetz/gruvbox'
" youcompleteme intelligent completion
Plugin 'valloric/youcompleteme'
" cmake integration
Plugin 'vhdirk/vim-cmake'
" multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" NERD Commenter
Plugin 'scrooloose/nerdcommenter'
" snippets engine
Plugin 'sirver/ultisnips'
" snippets are separated from the engine
Plugin 'honza/vim-snippets'
" auto brackets closing
Plugin 'raimondi/delimitmate'
" auto end for different if's, do's, def's, etc
Plugin 'tpope/vim-endwise'
" javascript improved highlighting and indentation
Plugin 'pangloss/vim-javascript'
" open files by name with Ctrl+p
Plugin 'kien/ctrlp.vim'
" search for text occurences with :Ack
Plugin 'mileszs/ack.vim'

call vundle#end()

