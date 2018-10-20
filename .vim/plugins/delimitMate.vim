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

