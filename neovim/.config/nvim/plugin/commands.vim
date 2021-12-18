" Delete current file from disk and buffer list
command! Rm :call delete(expand('%')) | bdelete!
