setlocal spell
setlocal nonumber
autocmd BufEnter .git/index call FugitiveJumpToFirst()
iabbr coaut Co-authored-by: Author Name <author@email>
