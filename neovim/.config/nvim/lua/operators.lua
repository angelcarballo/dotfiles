vim.cmd [[
  function! Sort(type, ...)
      '[,']sort
  endfunction
  nnoremap <silent> S :set opfunc=Sort<CR>g@
]]
