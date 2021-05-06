" enable truecolor (24 bit)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

syntax on                      " enable syntax highlighting
set visualbell                 " visual flash instead of beeping
set noerrorbells               " no flash on errors, only at beginning/end of file
set laststatus=2               " always show status bar
set listchars=tab:▸\ ,trail:·  " symbols for invisible characters
set list                       " show extra whitespace
let &showbreak='↳ '            " indicator for wrapped lines

" statusline
set statusline=                              " custom status line
set statusline+=%#Pmenu#                     " color...
set statusline+=\ %f\                        " relative path
set statusline+=%m                           " modified flag
set statusline+=%r                           " read only flag
set statusline+=%h                           " help flag
set statusline+=%w                           " preview flag
set statusline+=%=                           " right align the following ...
" set statusline+=%#TabLineFll#                " color...
set statusline+=\ %{FugitiveHead()}          " current git branch
" set statusline+=\ %#Pmenu#                 " color...
set statusline+=\ %c\ %l\/%L                  " current column, line and total lines
set statusline+=%#error#                     " color ...
set statusline+=%{StatuslineTrailingSpace()} " trailing white space indicator
set statusline+=%{StatuslineTabWarning()}    " mixed indentation indicator
set statusline+=%*                           " reset color

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
