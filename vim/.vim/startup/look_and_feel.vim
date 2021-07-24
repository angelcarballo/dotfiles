" enable truecolor (24 bit)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

function SetDarkTheme()
  set background=dark
  colorscheme apprentice
endfunction

function SetLightTheme()
  set background=light
  let g:solarized_statusline="flat"  " flat variant has a less distracting statusline
  let g:solarized_extra_hi_groups=1  " show filetype specific highlight groups
  let g:solarized_diffmode="high"    " make diffs as contrasty as possible
  colorscheme solarized8
endfunction

if g:os == "Darwin"
  if system("defaults read -g AppleInterfaceStyle") =~ "Dark"
    call SetDarkTheme()
  else
    call SetLightTheme()
  endif
else
  call SetLightTheme()
endif

syntax on                      " enable syntax highlighting
set visualbell                 " visual flash instead of beeping
set noerrorbells               " no flash on errors, only at beginning/end of file
set laststatus=2               " always show status bar
set listchars=tab:▸\ ,trail:·  " symbols for invisible characters
set list                       " show extra whitespace
set previewheight=20           " make preview bigger
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
set statusline+=%#Error#                     " color ...
set statusline+=%{StatuslineTrailingSpace()} " trailing white space indicator
set statusline+=%{StatuslineTabWarning()}    " mixed indentation indicator
set statusline+=%#Pmenu#                     " reset color
set statusline+=\ %-3.30{FugitiveHead()}     " current git branch
set statusline+=\ %c\ %l\/%L                 " current column, line and total lines

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
