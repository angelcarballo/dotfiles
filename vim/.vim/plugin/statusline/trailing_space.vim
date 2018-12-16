function! StatuslineTrailingSpace()
  if !exists("b:statusline_trailing_space_warning")
    let trailing = search('\s\+$', 'nw') != 0
    let help = &buftype == 'help'

    if trailing && !help
      let b:statusline_trailing_space_warning = '[tw]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction
