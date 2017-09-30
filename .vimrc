"
" vundle plugin manager part
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'			" let vundle manage vundle, required
Plugin 'tpope/vim-fugitive'			" git support
Plugin 'scrooloose/nerdtree'			" listing a directory tree
Plugin 'bling/vim-airline'			" cool status line
Plugin 'vim-airline/vim-airline-themes'		" themes for status line
Plugin 'scrooloose/syntastic'			" syntax check
Plugin 'majutsushi/tagbar'			" view and navigate tags in a split window
Plugin 'altercation/vim-colors-solarized'	" solarized colorscheme
Plugin 'valloric/youcompleteme'			" youcompleteme intelligent completion

call vundle#end()
filetype plugin indent on

"
" plugin settings
"

"
" settings for YouCompleteMe
"
let g:ycm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0			" delete stressfull preview window on top of file
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'	" to prevent bugs
set completeopt-=preview

"
" settings for solarized
"
set background=dark
colorscheme solarized

"
" settings for the airline
"
set laststatus=2			" status bar to be shown all the time
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
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
" Other settings
"

" Results of watching this video: https://www.youtube.com/watch?v=XA2WjJbmmoM
set path+=**			" Setting vim to find files recursively (+ tab complition): just <:find file>
" run <ctags -R .> => Ctrl-] jumps to next tag
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

set backspace=2		" make backspace work like most other apps
set number		" show line numbers
syntax on		" syntax highlight (off by default)
set incsearch		" increment search
set hlsearch		" highlight all search pattern matches
set ruler		" show the ruller every time
set showcmd		" uncomplete commands will be shown in the statusbar
set mouse=a		" mouse support
set mousemodel=popup
set hidden		" no need to write buffer before heading to another one
set ch=1		" command line height is set to 1
set mousehide		" hide mouse when typing
set autoindent		" required for smart indent
set smartindent		" setting smart indent
set t_Co=256		" more colors
set autoread		" autoread file on change
set smartcase		" search with case if search has letters in upper case
set wildmenu		" setting wild menu (every candidate is shown)
set wcm=<TAB>
set keymap=russian-jcukenwin	" enable russian 'layout' (keymap)
set iminsert=0			" by default keymap is still english
set imsearch=0			" but you can swithch it by typing <C-6>
set pastetoggle=<F2>		" pastetoggle
autocmd BufRead,BufNewFile *.tex setl noai nocin nosi inde= syntax=tex

"
" Mapping
"
vnoremap <C-c> "+y		" Ctrl+c in visual mod sends selection to clipboard
inoremap jj <ESC>		" no more annoying esc finding
nmap <F8> :TagbarToggle<CR>	" envocing Tagbar on <F8>

"
" Snippets
"
nnoremap \tex :-1read $HOME/.vim/snippets/std.tex<CR>15jA

"
" Commands
"

" Saving files with root priveledges without opening vim as root.
" Special thanks to planetp from Stack excange for it.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
