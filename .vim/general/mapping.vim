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

