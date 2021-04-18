function! StatuslineTrailingSpace()
  if !exists("b:statusline_trailing_space_warning")
    let trailing = search('\s\+$', 'nw') != 0
    let special = index(['help', 'fugitive', 'git'], &filetype) >= 0

    if trailing && !special
      let b:statusline_trailing_space_warning = '[tw]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction
