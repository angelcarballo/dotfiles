setlocal foldenable
setlocal foldmethod=syntax
" extra whitespace is annoying on git status page
setlocal nolist

" Fugitive only maps dd/dv/ds in blob buffers, so diffing a file from a commit
" takes two steps: <CR> into the blob, then dv. Collapse that into one.
" Guarded on 'commit' so it doesn't fire in :Git log output, also ft=git.
if get(b:, 'fugitive_type', '') ==# 'commit'
  nmap <buffer> <nowait> dv <CR>dv
  nmap <buffer> <nowait> ds <CR>ds
endif
