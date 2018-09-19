" ===========================================
"           
"           VIM run commands
"           place to $HOME/.vimrc
"
" ===========================================

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
" gdb in vim is awesome
"Plugin 'Conque-GDB'
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

"--------------------------------------------
" plugin settings
"

"
" settings for YouCompleteMe
"
let g:ycm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" delete stressfull preview window on top of file
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

"
" settings for gruvbox
"
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" to fix strange highlighting behaviour
"let g:dracula_italic = 0
colorscheme gruvbox

"
" settings for the airline
"

" status bar to be shown all the time
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

"
" settings for syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger="<c-j>"

"
" delimitMate
"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_smart_quotes  = 1
let delimitMate_smart_matchpairs = 1
" dirty hack to remap <BS> from youcompleteme to delimitMate
imap <silent> <BS> <C-R>=YcmOnDeleteChar()<CR><Plug>delimitMateBS

function! YcmOnDeleteChar()
  if pumvisible()
    return "\<C-y>"
  endif
  return "" 
endfunction

"
" autostart NERDTree
"

" auto open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" quit from vim, if NERDTree is only left tab
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" CtrlP
"

" custom ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"
" Ack
"

" Use the silver searcher if it is installed
if executable('ag')
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"--------------------------------------------
" Other settings
"

" make backspace work like most other apps
set backspace=2
" show line numbers
set number
" increment search
set incsearch
" highlight all search pattern matches
set hlsearch
" show the ruller every time
set ruler
" uncomplete commands will be shown in the statusbar
set showcmd
" no need to write buffer before heading to another one
set hidden
" command line height is set to 1
set ch=1
" hide mouse when typing
set mousehide
" enable mouse use
set mouse=a
" more colors
"set t_Co=256
" autoread file on change
set autoread
" search with case if search has letters in upper case
set smartcase
" setting wild menu (every candidate is shown)
set wildmenu
set wcm=<TAB>
" enable russian keymap
set keymap=russian-jcukenmac
" by default keymap is still english switching with <C-6>
set iminsert=0
set imsearch=0
" pastetoggle
set pastetoggle=<F2>

"
" Autocommands
"
"autocmd BufRead,BufNewFile *.tex setl nosi nocin inde= syntax=tex

"
" Indentation
"

" modern way to enable indentation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Delete all 4 spaces after tab with one backspace
set softtabstop=4

"
" Mapping
"

" swap j/k and gj/gk
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
" no more annoying esc finding
inoremap jj <ESC>		
" sync syntax highlighting on <F-12>
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" macOS bind Alt+hjkl
inoremap ∆ <ESC><Down>
inoremap ˚ <ESC><UP>
inoremap ˙ <ESC><LEFT>
inoremap ¬ <ESC><RIGHT>
" ycm go to shortcut
nnoremap gt :YcmCompleter GoTo<CR>

"
" Snippets
"
nnoremap \texbase :-1read $HOME/.vim/snippets/std.tex<CR>16j
nnoremap \texpic :-1read $HOME/.vim/snippets/includegraphics-figure.tex<CR>5jdd3kf{l

"
" Commands
"

" Saving files with root priveledges without opening vim as root.
" Special thanks to planetp from Stack excange for it.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
