function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'ᚠ '.l:branchname.' ':''
endfunction


" Recalculate the tab warning flag when idle and after writing
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0
    let help = &buftype == 'help'

    if tabs && spaces && !help
      let b:statusline_tab_warning =  '[mixed-indenting]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif
  return b:statusline_tab_warning
endfunction

" Recalculate the trailing whitespace warning when idle, and after saving
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    let trailing = search('\s\+$', 'nw') != 0
    let help = &buftype == 'help'

    if trailing && !help
      let b:statusline_trailing_space_warning = '[tw]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction
