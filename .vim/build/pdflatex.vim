function! BuildPdflatex()
    !pdflatex % && bibtex %:r.aux && pdflatex %
endfunction

command! BuildPdflatex call BuildPdflatex()

