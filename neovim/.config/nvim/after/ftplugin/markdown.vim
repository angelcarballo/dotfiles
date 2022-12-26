let g:markdown_folding = 1
let g:markdown_fenced_languages = ['ruby', 'bash=sh', 'javascript', 'js=javascript', 'elixir', 'json', 'python']

setlocal wrap
setlocal textwidth=1000
setlocal foldlevel=99
setlocal spell
setlocal formatprg=pandoc\ --from=gfm\ --to=gfm

xmap <buffer> K S]f]a(

iab mdtable 
\<CR>\| Column 1      \| Column 2     \| Column 3     \|
\<CR>\| :-----------  \| :----------: \| -----------: \|
\<CR>\| Cell content  \| Cell content \| Cell content \|
