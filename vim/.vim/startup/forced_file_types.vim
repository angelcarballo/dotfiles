" generic
autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
autocmd BufRead,BufNewFile *.prawn setfiletype ruby
autocmd BufRead,BufNewFile *.tmux setfiletype tmux
autocmd BufRead,BufNewFile *.cfg setfiletype puppet
autocmd BufRead,BufNewFile init.el setfiletype lisp
autocmd BufRead,BufNewFile .spacemacs setfiletype lisp
autocmd BufRead,BufNewFile *.hocon setfiletype yaml
autocmd BufRead,BufNewFile *.md setfiletype markdown
autocmd BufRead,BufNewFile *.trello setfiletype markdown
autocmd BufRead,BufNewFile *.vader setfiletype vim

" simplybusiness/schema_registry
autocmd BufRead,BufNewFile *jsonschema/?-?-? setfiletype json
