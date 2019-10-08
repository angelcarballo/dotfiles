" enable truecolor (24 bit)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

syntax on                      " enable syntax highlighting
set visualbell                 " visual flash instead of beeping
set noerrorbells               " no flash on errors, only at beginning/end of file
set laststatus=2               " always show status bar
set listchars=tab:▸\ ,trail:·  " symbols for invisible characters
set list                       " show extra whitespace
let &showbreak='↳ '            " indicator for wrapped lines

" statusline
set statusline=                                     " custom status line
set statusline+=%#Pmenu#                            " color...
set statusline+=\ %f\                               " relative path
set statusline+=%m                                  " modified flag
set statusline+=%r                                  " read only flag
set statusline+=%h                                  " help flag
set statusline+=%w                                  " preview flag
set statusline+=%=                                  " right align the following ...
set statusline+=%#TabLine#                            " color...
set statusline+=%c                                  " current column
set statusline+=%#Pmenu#                            " color...
set statusline+=\ %l\/%L\                           " current line and total lines
set statusline+=%#error#                            " color ...
set statusline+=%{StatuslineTrailingSpace()}        " trailing white space indicator
set statusline+=%{StatuslineTabWarning()}           " mixed indentation indicator
set statusline+=%*                                  " reset color

" colorscheme config managed by base16
if filereadable(expand("~/.vim_colorscheme"))
  let base16colorspace=256
  source ~/.vimrc_background

  " hide end of buffer indicators
  highlight EndOfBuffer ctermfg=bg ctermbg=bg

  " highlight spelling mistakes with an underline
  highlight clear SpellBad
  highlight SpellBad cterm=underline
  highlight SpellBad gui=undercurl

  " highlight current tab
  highlight TabLineSel guifg=bg guibg=fg

  " highlight character 121 to avoid long lines
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%121v', 121)
endif

" highlight trailing spaces
match ErrorMsg '\s\+$'

