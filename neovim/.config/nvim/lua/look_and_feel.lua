vim.opt.termguicolors = true        -- enable truecolor (24 bit)
vim.g.solarized_statusline = 'flat' -- flat variant has a less distracting statusline
vim.g.solarized_extra_hi_groups = 1 -- show filetype specific highlight groups
vim.g.solarized_diffmode = 'high'   -- make diffs as contrasty as possible

vim.cmd [[
  function SetDarkTheme()
    set background=dark
    colorscheme apprentice
  endfunction

  function SetLightTheme()
    set background=light
    colorscheme solarized-flat
  endfunction

  function SetTheme()
    if g:os == "Darwin"
      if system("defaults read -g AppleInterfaceStyle") =~ "Dark"
        call SetDarkTheme()
      else
        call SetLightTheme()
      endif
    else
      call SetLightTheme()
    endif
  endfunction

  call SetTheme()
]]

vim.opt.visualbell = true                   -- visual flash instead of beeping
vim.opt.errorbells = false                  -- no flash on errors, only at beginning/end of file
vim.opt.laststatus = 2                      -- always show status bar
vim.opt.list = true                         -- show extra whitespace
vim.opt.previewheight = 20                  -- make preview bigger
vim.cmd [[
   set listchars=tab:▸\ ,trail:·               " symbols for invisible characters
   let &showbreak='↳ '                         " indicator for wrapped lines
]]

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
