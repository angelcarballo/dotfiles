" Replicate some of the default netrw mappings
noremap <buffer> % :e %
noremap <buffer> D :!mkdir -p %
noremap <buffer> R :!mv <c-r>=expand("<cWORD>")<cr> <c-r>=expand("<cWORD>")<cr>
noremap <buffer> <leader>d .rm -rf
xmap <buffer> <leader>d .rm -rf
