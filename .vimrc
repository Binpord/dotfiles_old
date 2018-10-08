" ===========================================
"           
"           VIM run commands
"           place to $HOME/.vimrc
"
" ===========================================

function! SourceDirectory(dir)
    for l:file in split(globpath(a:dir, '*.vim'), '\n')
        exe 'source' l:file
    endfor
endfunction

call SourceDirectory('$HOME/.vim/plugin')
" general settings
call SourceDirectory('$HOME/.vim/settings')
" build functions
call SourceDirectory('$HOME/.vim/build')
" system-specific settings
" [:-2] to remove trailing newline
let s:uname = system('uname')[:-2]
call SourceDirectory('$HOME/.vim/' . s:uname)
" custom settings
call SourceDirectory('$HOME/.vim/custom')

