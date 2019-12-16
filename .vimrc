"""""""""""""""""""""""""""""
" Vadim Shiyanov Vimrc config
"""""""""""""""""""""""""""""

"
" General settings
"
set nocompatible
filetype plugin on
syntax on
set wrap
set encoding=utf8

"
" Use homebrew python3 if on MacOS
"
if has('mac')
    let python_interpreter='/usr/local/bin/python3'
else
    let python_interpreter='python3'
endif

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': python_interpreter . ' install.py --clang-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'

call plug#end()

"
" Settings
"

" Lines
set number
set ruler

" Tabulation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Status line
set showcmd
set ch=1
set wildmenu
set wcm=<TAB>

" Mouse
set mousehide
set mouse=a

" Buffers
set hidden
set autoread

" YouCompleteMe
let g:ycm_path_to_python_interpreter=python_interpreter
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_extra_conf=1
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'

" Ack
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Make backspace work like in most other apps
set backspace=2

" Paste toggle
set pastetoggle=<F2>

" Russian keymap
if has('mac')
    set keymap=russian-jcukenmac
else
    set keymap=russian-jcukenwin
endif
set iminsert=0
set imsearch=0

" fzf
nnoremap <c-p> :Files<CR>

" Swap j/k and gj/gk
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" No more anoying esc finding
inoremap jj <ESC>

"
" Commands
"

" Saving files with root priveledges without opening vim as root.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
