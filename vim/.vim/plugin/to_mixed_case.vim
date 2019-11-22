" Casts the selected text to MixedCase
"   `Some regular text` -> `SomeRegularText`
"
function! ToMixedCase() range
  " lowercase selection
  execute "normal! gvu"
  " uppercase first letter of each word
  :silent! :'<,'>s/\%V \(\w\)/\u\1/g
  " uppercase first letter of selection
  execute "normal! `<gUl"
endfunction
