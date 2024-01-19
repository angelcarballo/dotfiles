" Delete current file from disk and buffer list
command! Rm :call delete(expand('%')) | bdelete!

" Alternative to Netrw's :Browse, used by vim-fugitive
command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)
