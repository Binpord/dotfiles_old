"
" Commands
"

" Saving files with root priveledges without opening vim as root.
" Special thanks to planetp from Stack excange for it.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

