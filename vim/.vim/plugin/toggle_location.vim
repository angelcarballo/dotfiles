function! ToggleLocation()
  for i in range(1, winnr('$'))
    let bufnum = winbufnr(i)
    if getbufvar(bufnum, '&buftype') == 'quickfix'
      lclose
      return
    endif
  endfor

  lopen
endfunction
