function FugitiveJumpToFirst()
  if line(".") == 1
    execute "normal ^N"
  endif
endfunction

