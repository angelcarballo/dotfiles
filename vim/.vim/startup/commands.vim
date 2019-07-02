" change colorscheme
command! Light :call Light()<cr>
command! Dark :call Dark()<cr>

" preview markdown files using markoff (only mac)
if g:os == 'Darwin'
  command! MarkdownPreview silent! execute "!markoff %" | redraw!
endif
