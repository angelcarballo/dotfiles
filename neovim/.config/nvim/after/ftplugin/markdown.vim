let g:markdown_folding = 1
let g:markdown_fenced_languages = ['ruby', 'bash=sh', 'javascript', 'js=javascript', 'elixir', 'json', 'python']

set wrap
set textwidth=1000
set tabstop=2
set shiftwidth=2
set foldlevel=99
set spell
setlocal formatprg=pandoc\ --from=gfm\ --to=gfm

xmap <buffer> K S]f]a(

iab mdtable 
\<CR>\| Column 1      \| Column 2     \| Column 3     \|
\<CR>\| :-----------  \| :----------: \| -----------: \|
\<CR>\| Cell content  \| Cell content \| Cell content \|
