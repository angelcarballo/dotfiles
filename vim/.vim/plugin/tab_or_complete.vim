function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<c-n>"
  else
    return "\<tab>"
  endif
endfunction
