" Extracts the visual selection as a new method
function! ExtractMethod() range
  let name = inputdialog("Method name: ")
  " save selection (reg:z)
  execute "normal! gv\"zy"
  " replace selection with method call
  execute "normal! gvc".name."\<esc>"
  " move to next empty line
  normal! }
  " add new method
  if @z =~ "\n$"
    execute "normal! O\<cr>def ".name."\<cr>\<c-r>zend\<esc>"
  else
    execute "normal! O\<cr>def ".name."\<cr>\<c-r>z\<cr>end\<esc>"
  endif
  " format new method
  execute "normal! =?def\<cr>"
endfunction
