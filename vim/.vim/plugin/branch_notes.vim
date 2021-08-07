function! BranchNotesPath()
  if isdirectory('.git')
    " Current work dir is git's work tree
    let location = getcwd().'/.git'
  else
    " Look upwards (at parents) for a directory named '.git'
    let location = finddir('.git', '.;')
  endif
  if len(location) > 0
    return location.'/notes-'.FugitiveHead()
  else
    return getcwd().'/.notes'
  endif
endfunction
