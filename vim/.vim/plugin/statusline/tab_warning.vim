function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0
    let help = &buftype == 'help'
    let git = &buftype == 'git'

    if tabs && spaces && !help && !git
      let b:statusline_tab_warning =  '[mixed-indenting]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif
  return b:statusline_tab_warning
endfunction

