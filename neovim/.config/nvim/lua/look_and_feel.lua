-- statusline

vim.cmd [[
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

  set statusline=                              " custom status line
  set statusline+=%#Pmenu#                     " color...
  set statusline+=\ %f\                        " relative path
  set statusline+=%m                           " modified flag
  set statusline+=%r                           " read only flag
  set statusline+=%h                           " help flag
  set statusline+=%w                           " preview flag
  set statusline+=%=                           " right align the following ...
  set statusline+=%#Error#                     " color ...
  " set statusline+=%{StatuslineTrailingSpace()} " trailing white space indicator
  " set statusline+=%{StatuslineTabWarning()}    " mixed indentation indicator
  set statusline+=%#Pmenu#                     " reset color
  " set statusline+=\ %-3.30{FugitiveHead()}     " current git branch
  set statusline+=\ %c\ %l\/%L                 " current column, line and total lines
]]

-- TODO convert to lua
vim.cmd [[
  " highlight spelling mistakes with an underline
  highlight clear SpellBad
  highlight SpellBad cterm=underline gui=undercurl

  " highlight current tab
  highlight TabLineSel guifg=bg guibg=fg

  " highlight character 121 to avoid long lines
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%121v', 121)

  " highlight trailing spaces
  match ErrorMsg '\s\+$'

  " tidier fold lines
  function! CustomFold()
    let line = getline(v:foldstart)
    return '… ' . line
  endfunction
  set foldtext=CustomFold()
  set fillchars=fold:\ 
]]
