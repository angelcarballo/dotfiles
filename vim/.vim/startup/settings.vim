set number
set confirm                           " ask instead of just erroring if the current file has unsaved changes
set autowrite                         " auto write after make, ! and friends
set showcmd                           " show complete commands
set scrolloff=3                       " leave space after the current line
set noswapfile                        " disable swap files, let git do the work
set splitright                        " open new vertical split panes to right
set history=200                       " increase history (default: 50)
set incsearch                         " incremental search
set ignorecase                        " ignore case on search ...
set smartcase                         " ... except if query contains uppercase characters
set infercase                         " ... same thing for keyword completion
set nowrap                            " don't wrap lines when they're too long for current screen size
set backspace=indent,eol,start        " backspace through everything
set wildmenu                          " visual auto complete for command menu
set wildmode=longest:full,full        " complete with the longest matching substring, also show menu. Hitting tab again moves between matches
set ttyfast                           " send extra characters to terminal (improves smoothness)
set formatoptions+=j                  " delete comment character when joining commented lines
set autoread                          " if a file changes outside Vim, reload its contents automatically
set undofile                          " persist undo history
set undodir=$HOME/.vim/undo           " where to store undo files
set nojoinspaces                      " only insert one space when joining after an '.'
set breakindent                       " keep indentation on wrapped lines
set tabstop=2                         " tab indent with 2 spaces by default (file types override this)
set shiftwidth=2                      " shift indent with 2 spaces by default (file types override this)
set expandtab                         " indent with spaces by default (override by file type)
" set regexpengine=1                  " use old regexp engine, as new one has low performance with big ruby files
set spelllang=en_us,es                " enable English spell check
set spellsuggest=fast,20              " don't show too many suggestions for spell check
set spellcapcheck=                    " don't check for end of sentence and capitalization, it doesn't work well with abbreviations
set cryptmethod=blowfish2             " use blowfish 2 crypto method by default (zip is too weak)
set dictionary+=/usr/share/dict/words " auto complete words from system dictionary
set tags^=./.git/tags;                " read tags from git directory
set nofoldenable                      " do not fold by default
set shortmess-=S                      " show total and number of current result after a search
set hidden                            " allow closing buffers with unsaved changes

set spellfile=~/Drive/vim/spell/en.utf-8.add
set diffopt=filler,internal,algorithm:histogram,indent-heuristic

" setup completion (affects c-n, c-p, c-x c-n, c-x c-p)
set complete=
set complete+=.  " complete with words from current buffer
set complete+=w  " complete with words from other windows
set complete+=b  " complete with words from other loaded buffers
set complete+=u  " complete with words from other unloaded buffers
set complete+=t  " complete with tags

" enable mouse support
set ttymouse=sgr
set mouse=a

if executable('rg')
  " Use ripgrep over Grep
  set grepprg=rg\ --vimgrep\ --no-heading\ --hidden\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Activate bracketed paste in tmux
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif
