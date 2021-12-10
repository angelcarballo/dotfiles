" makes * and # work on visual mode too.  global function so user mappings can call it.
" Extracted from https://github.com/bronson/vim-visual-star-search/blob/master/plugin/visual-star-search.vim
function! SetVisualSearch(cmdtype,...)
  let temp = @"
  normal! gvy
  let @" = escape(@", a:cmdtype.'\*')
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @" = temp
endfunction
