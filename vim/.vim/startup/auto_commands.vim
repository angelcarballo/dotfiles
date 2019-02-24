augroup AUTOMARKS
  autocmd!

  " Set mark <S> for the last visited spec file
  autocmd BufLeave *_spec.rb normal! mS

  " Set mark <F> for the last visited feature file
  autocmd BufLeave *.feature normal! mF
augroup END

augroup STATUSLINE
  autocmd!

  " Recalculate the trailing whitespace warning when idle, and after saving
  " http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
  autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

  " Recalculate the tab warning flag when idle and after writing
  " http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
  autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
augroup END

augroup QUICKFIX
  autocmd!

  " open quickfix window after using Grep, grep, vimgrep
  autocmd QuickFixCmdPost *grep* nested cwindow | redraw!

  " quickfix window should always be full width
  autocmd FileType qf wincmd J
augroup END
