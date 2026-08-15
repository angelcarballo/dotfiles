let g:markdown_folding = 1
let g:markdown_fenced_languages = ['ruby', 'bash=sh', 'javascript', 'js=javascript', 'elixir', 'json', 'python']

setlocal wrap
setlocal foldlevel=99
setlocal spell

xmap <buffer> K S]f]a(

iab mdtable 
\<CR>\| Column 1      \| Column 2     \| Column 3     \|
\<CR>\| :-----------  \| :----------: \| -----------: \|
\<CR>\| Cell content  \| Cell content \| Cell content \|
