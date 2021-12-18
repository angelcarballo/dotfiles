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
