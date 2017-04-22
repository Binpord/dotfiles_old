"===================================================================================================
" vundle plugin manager part
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'		" let vundle manage vundle, required
" Plugin 'tpope/vim-fugitive'		" git support
Plugin 'scrooloose/nerdtree'		" listing a directory tree
Plugin 'bling/vim-airline'		" cool status line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'		" syntax check
Plugin 'majutsushi/tagbar'		" view and navigate tags in a split window
" Plugin 'honza/vim-snippets'		" ultimate snippets collection
" Plugin 'sirver/ultisnips'		" snippet manager
Plugin 'altercation/vim-colors-solarized' " solarized colorscheme
Plugin 'valloric/youcompleteme'		" youcompleteme intelligent completion

call vundle#end()
filetype plugin indent on
"===================================================================================================

"===================================================================================================
" plugin settings
"---------------------------------------------------------------------------------------------------
" settings for YouCompleteMe
let g:ycm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0	" delete stressfull preview window on top of file
set completeopt-=preview			" 
"---------------------------------------------------------------------------------------------------
" settings for solarized
set background=light
colorscheme solarized
"---------------------------------------------------------------------------------------------------
" settings for the airline
set laststatus=2		" status bar to be shown all the time
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
"---------------------------------------------------------------------------------------------------
" settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"---------------------------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"===================================================================================================

"===================================================================================================
" Other settings
"--------------------------------------------------------------------------------
" Results of watching this video: https://www.youtube.com/watch?v=XA2WjJbmmoM
set path+=**			" Setting vim to find files recursively (+ tab complition): just <:find file>
" run <ctags -R .> => Ctrl-] jumps to next tag
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
"--------------------------------------------------------------------------------
" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
"--------------------------------------------------------------------------------

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
"===================================================================================================

"===================================================================================================
" Mapping
vnoremap <C-c> "+y		" Ctrl+c in visual mod sends selection to clipboard
inoremap jj <ESC>		" no more annoying esc finding
" map <C-d> :NERDTreeToggle<CR>	" envocing NerdTree on C-d
nmap <F8> :TagbarToggle<CR>	" envocing Tagbar on <F8>
"===================================================================================================
" Vim notes (used to be in Google Keep)
"===================================================================================================
" :b substring => tab to wildmenu or just enter to switch to the buffer
" :r filename - (r is for read) writes content of the file in the doc, you are working with
" <C-r> - in normal mode redo
" ====================================================
" https://www.youtube.com/watch?v=v0W7JkzQAzA
" https://www.cs.clemson.edu/acm/presentations/?vim#/
" <C-r> in insert mode puts the register //remember about it
" . - (I) runs exact same command to prev one
" -------------------------
" Next character:
" f<char> (inclusive)
" t<char> (exclusive)
" F<char> and T<char> for previous char-s
" -------------------------
" qa record a macro in register a
" q to finish recording
" @a execute the macro in register a
" -------------------------
" :ls - list buffers
" -------------------------
" <C-w> prefixes most window commands
" <C-w>v vertical split
" <C-w>s horizontal split
" <C-w>n new buffer in a horizontal split window
" <C-w>c close the window -- useful for escaping from :h <anything>.
" Tons of window commands! Check :h windows
" -------------------------
" <C-x><C-f> File paths
" <C-x><C-d> Definition
" <C-x><C-]> Tags
" <C-x><C-i> Keywords
" <C-x><C-l> lines
" <C-x><C-v> Vim commands
" -------------------------
" :make <make_target>
" :set makeprg
" :cn :cw :cp ]c [c
" :copen
" :shell
" -------------------------
" Ctrl-w w - navigate between opened windows
" "+p              - paste/yank from/to system buffer
" "+y
" -------------------------
" Buffers:
" :bn :bp - navigation
" :bd - closing one
" :edit filename - open file in new buffer
" ====================================================
" http://vim.wikia.com/wiki/Moving_around
" ====================================================
" v - режим выделения
" V - режим построчного выделения
" <C-v>- режим блочного выделения
" https://habrahabr.ru/post/28190/
" ====================================================
" :lclose - closing syntastic window (location list close)
" -- somehow connected with bash
" <C-h> " delete back one character (backspace)
" <C-w> " delete back one word
" <C-u> " delete back to start of line
" <C-k> " delete forward to end of line
" <C-[ > " Esc in all mods
" ====================================================
" <C-d> - down half screen
" <C-u> - up half screen
" ====================================================
" <Alt-normal_mode_key> - sends normal_mode_key to normal mode + switches modes
" http://vim.wikia.com/wiki/Avoid_the_escape_key
" ====================================================
" <C-]> - go to tag
" <C-t> - go back
" ====================================================
" <C-o> - to undo jump (such as caused by gg or G)
" ====================================================
