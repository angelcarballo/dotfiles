" Casts the selected text to camelCase
"   `Some regular text` -> `someRegularText`
"
function! ToCamelCase() range
  execute "normal! gvu"
  :silent! :'<,'>s/\%V \(\w\)/\u\1/g
endfunction
