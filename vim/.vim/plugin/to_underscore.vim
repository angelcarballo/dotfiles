" Casts the selected text to snake_case
"   `Some regular text` -> `some_regular_text
"
function! ToUnderscore() range
  :silent! :'<,'>s/\%V /_/g
  execute "normal! gvu"
endfunction
