" change colorscheme
command Light !light
command Dark !dark

" preview markdown files using markoff (only mac)
if g:os == 'Darwin'
  command! MarkdownPreview silent! execute "!markoff %" | redraw!
endif
