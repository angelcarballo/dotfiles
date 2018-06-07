setlocal spell
setlocal nonumber
autocmd BufEnter .git/index call JumpToFirstGitFile()
iabbr coaut Co-authored-by: Author Name <author@email>
