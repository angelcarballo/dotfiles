function! JumpToFirstGitFile()
  if line(".") == 1
    execute "normal "
  endif
endfunction
