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
" set statusline+=%c\ %l\/%L\                       " current column, line and total lines
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
  source ~/.vim_colorscheme
  " hide split borders
  " highlight VertSplit guibg=bg guifg=bg
  " hide end of buffer indicators
  highlight EndOfBuffer ctermfg=bg ctermbg=bg
endif

" highlight trailing spaces
match ErrorMsg '\s\+$'

" highlight character 121 to avoid long lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%111v', 120)

highlight clear SpellBad
highlight SpellBad cterm=underline
