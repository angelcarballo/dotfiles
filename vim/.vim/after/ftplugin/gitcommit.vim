setlocal spell
setlocal nonumber
autocmd BufEnter .git/index call JumpToFirstGitFile()
