" There is no native lua API for abbreviations yet

iabbr lorem Lorem ipsum dolor sit amet
iabbr plorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
iabbr shebang #!/bin/sh
iabbr contenttype Content-type: application/json
iabbr <expr> cdate strftime('%d/%m/%Y')
iabbr <expr> fdate strftime('%a %d %b %Y')
iabbr <expr> jdate '# '.strftime('%a %d %b %Y').'<cr>-<esc>o<esc>kA'
iabbr <expr> bdate strftime('%Y-%m-%dT%X%z')
iabbr <expr> cb fugitive#head()

cnoreabbrev cfile %:p
cnoreabbrev cdir %:p:h
cnoreabbrev vfind vert sf<space>

" abbreviations expanded only at the beginning of the command line
cnoreabbrev <expr> grep (getcmdtype() == ':' && getcmdline() =~ '^grep$')? 'silent grep' : 'grep'
cnoreabbrev <expr> no (getcmdtype() == ':' && getcmdline() =~ '^no$')? 'Cfilter!' : 'no'
cnoreabbrev <expr> only (getcmdtype() == ':' && getcmdline() =~ '^only$')? 'Cfilter' : 'only'
cnoreabbrev <expr> run (getcmdtype() == ':' && getcmdline() =~ '^run$')? 'VimuxRunCommand<space>""<left>' : 'run'
cnoreabbrev <expr> dup (getcmdtype() == ':' && getcmdline() =~ '^dup$')? 'saveas %:s?' : 'dup'

" don't fight it!
iabbr resopnse response
iabbr resopnses responses
