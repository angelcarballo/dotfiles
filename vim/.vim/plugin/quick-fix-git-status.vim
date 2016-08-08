" Generate s simple quickfix dic from a file path
function! QuickFixItemFromPath(key, val)
  return {'filename': a:val}
endfunction

" Populate QuickFix list with file modified on current git repository
function! QuickFixGitStatus()
  let paths = split(system("git-list-modified"), "\n")
  let quickfix_items = map(paths, function('QuickFixItemFromPath'))
  call setqflist(quickfix_items)
  echo "Git changes loaded on quickfix list"
endfunction

