"""""""""""""""""""""""""""""
" Vadim Shiyanov Vimrc config
"""""""""""""""""""""""""""""

"
" Vim-plug
"
set nocompatible
syntax on
set wrap
set encoding=utf8

"
" Use homebrew python3 if on MacOS
"
if has('mac')
    let python_interpreter = '/usr/local/bin/python3'
else
    let python_interpreter = 'python3'
endif

call plug#begin('~/.vim/plugged')

" Utility
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': python_interpreter . ' install.py --clang-completer' }
Plug 'fs111/pydoc.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'wesQ3/vim-windowswap'

" Looks
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

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

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Theme and Styling
set t_Co=256
set background=dark
if (has("termguicolors"))
    set termguicolors
endif
colorscheme gruvbox

" NERDTree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 0

" YouCompleteMe
let g:ycm_path_to_python_interpreter = python_interpreter
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_smart_quotes  = 1
let delimitMate_smart_matchpairs = 1

" vim-gitgutter
set updatetime=100

" Ack
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Make backspace work like in most other apps
set backspace=2

" Paste toggle
set pastetoggle=<F2>

" Elite mode. No arrows!!!
let g:elite_mode=1
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

"
" Mapping
"

" NERDTree
nnoremap <c-q> :NERDTreeToggle<CR>

" YouCompleteMe
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" delimitMate
" dirty hack to remap <BS> from youcompleteme to delimitMate
function! YcmOnDeleteChar()
    if pumvisible()
        return "\<C-y>"
    endif
    return ""
endfunction

imap <silent> <bs> <c-r>=YcmOnDeleteChar()<CR><Plug>delimitMateBS

" fzf
nnoremap <c-p> :Files<CR>

" Swap j/k and gj/gk
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-c> <c-w><c-c>

" No more anoying esc finding
inoremap jj <ESC>

" Remove trailing space on F5
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


"
" Commands
"

" Saving files with root priveledges without opening vim as root.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Command for sourcing vimrc
command! ReloadVim source ~/.vimrc
