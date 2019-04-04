function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<c-p>"
  else
    return "\<tab>"
  endif
endfunction
