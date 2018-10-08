function! BuildClang()
    let l:compiler = 'clang'
    if &filetype == 'cpp'
        let l:compiler = 'clang++'
    endif
    execute '!' . l:compiler . ' % -o %:t:r -g2'
endfunction

command! BuildClang call BuildClang()

