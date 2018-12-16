" Show current git branch if present (via fugitive)
function! StatuslineGit()
  let l:branchname = exists("*fugitive#head") ? "@".fugitive#head() : ""
  return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction
