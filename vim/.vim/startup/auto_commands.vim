augroup STATUSLINE
  autocmd!

  " Recalculate the trailing whitespace warning when idle, and after saving
  " http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
  autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning

  " Recalculate the tab warning flag when idle and after writing
  " http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
  autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning
augroup END

augroup GITCOMMIT
  autocmd!

  autocmd FileType gitcommit wincmd L
augroup END

augroup QUICKFIX
  autocmd!

  " open quickfix/location window after using grep
  autocmd QuickFixCmdPost grep cwindow | redraw!
  autocmd QuickFixCmdPost lgrep redraw!

  " quickfix window should always be full width
  autocmd FileType qf wincmd J
augroup END

augroup HELP
  autocmd!

  " open help splitting to the right
  autocmd FileType help wincmd L
augroup END

augroup PROJECT_PATH
  autocmd!

  autocmd Bufread,BufNewFile */dotfiles/* set path+=
        \vim/.vim/.*,vim/.vim/after/**,vim/.vim/plugin/**,vim/.vim/scripts/**,vim/.vim/skeleton/**,vim/.vim/startup/**,
        \bash/**,
        \bin/**,
        \cheats/**,
        \common/**,
        \git/**,
        \osx/**,
        \rbenv/**,
        \rspec/**,
        \ruby/**,
        \tmux/**,tmux/.tmux/**,
        \wasavi/**,
        \zsh/**,zsh/.zsh/**
augroup END

augroup SYNTAX_COMPLETE
  autocmd!

  " Enalbe syntax based completion for filetypes that do not define their own
  " function. This uses existing file type keywords as source.
  autocmd Filetype *
        \  if &omnifunc == "" |
        \    setlocal omnifunc=syntaxcomplete#Complete |
        \  endif
augroup END

augroup FUGITIVE
  autocmd!

  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> - :edit %:h<CR> |
    \ endif
augroup END

augroup OpenQuickfixWindowAfterMake
  autocmd!

  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
augroup END
