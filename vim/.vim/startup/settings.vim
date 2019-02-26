"" General settings ----------------------------------------------------------{{{
set autowrite                        " autowrite after make, ! and friends
set complete-=i                      " searching includes can be slow
set showcmd                          " show complete commands
set number                           " show line numbers
set ruler                            " show cursor position
set scrolloff=3                      " leave space after the current line
set foldmethod=marker                " fold using {{{ .. }}} markers
set diffopt+=vertical                " always use vertical diffs
set noswapfile                       " disable swap files, let git do the work
set splitright                       " open new vertical split panes to right
set history=200                      " increase history (default: 50)
set hlsearch                         " highlight search results
set incsearch                        " incremental search
set ignorecase                       " ignore case on search ...
set smartcase                        " ... except if query contains uppercase characters
set infercase                        " ... same thing for keyword completion
set nowrap                           " don't wrap lines
set backspace=indent,eol,start       " backspace through everything
set wildmenu                         " visual auto complete for command menu
set ttyfast                          " send extra characters to terminal (improves smoothness)
set lazyredraw                       " redraw only when needed
set formatoptions+=j                 " delete comment character when joining commented lines
set omnifunc=syntaxcomplete#Complete " enable omni completion
set magic                            " eval special character as 'special' by default, for example . is any character, and \. is a dot
set autoread                         " if a file changes outside Vim, reload its contents automatically
set undofile                         " persist undo history
set undodir=$HOME/.vim/undo          " where to store undo files
set nojoinspaces                     " only insert one space when joining after an '.'
set breakindent                      " keep indentation on wrapped lines
set tabstop=4                        " tabs use 4 spaces by default (filetypes override this)
set expandtab                        " indent with spaces by default (overriden by filetype)
set regexpengine=1                   " use old regexp engine, as new one has low performance with big ruby files
set spelllang=en_us                  " enable english spell check
set spellsuggest=fast,20             " don't show too many suggestions for spell check.
set cryptmethod=blowfish2                     " use blowfish 2 crypto method by default (zip is too weak)
set spellfile=~/Dropbox/vim/spell/en.utf-8.add

" Extended mouse support
if !has('nvim')
  set ttymouse=xterm2
endif

if executable('rg')
  " Use ripgrep over Grep
  set grepprg=rg\ --vimgrep
endif
" ---------------------------------------------------------------------------}}}
