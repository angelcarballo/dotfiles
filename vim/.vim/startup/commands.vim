" Basic function to command mappings
command! Light :call Light()<cr>
command! Dark :call Dark()<cr>
command! -range ToUnderscore :call ToUnderscore()<cr>
command! -range ToCamelCase :call ToCamelCase()<cr>
command! -range ToMixedCase :call ToMixedCase()<cr>

" Preview markdown files using markoff (only mac)
if g:os == 'Darwin'
  command! MarkdownPreview silent! execute "!open -a \"Marko\" %" | redraw!
endif

" Delete current file
command! Rm :call delete(expand('%')) | bdelete!
