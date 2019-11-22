" Basic function to command mappings
command! Light :call Light()<cr>
command! Dark :call Dark()<cr>
command! -range ToUnderscore :call ToUnderscore()<cr>
command! -range ToCamelCase :call ToCamelCase()<cr>
command! -range ToMixedCase :call ToMixedCase()<cr>

" preview markdown files using markoff (only mac)
if g:os == 'Darwin'
  command! MarkdownPreview silent! execute "!markoff %" | redraw!
endif
