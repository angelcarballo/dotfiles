let g:markdown_fenced_languages = ['ruby', 'bash=sh']

set wrap
set textwidth=1000
set tabstop=2
set shiftwidth=2
set foldlevel=99
set spell
setlocal formatprg=pandoc\ --from=gfm\ --to=gfm

xmap <buffer> K S]f]a(
