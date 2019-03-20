" initialize plugin manager
packadd minpac
call minpac#init()

"{{{ Plugins

" Basic plugins
call minpac#add('kana/vim-textobj-user')            " custom text object support
call minpac#add('tpope/vim-vinegar')                " file manager improvements
call minpac#add('tpope/vim-repeat')                 " extend repeat support
call minpac#add('tpope/vim-unimpaired')             " multiple mappings using [ & ]
call minpac#add('AndrewRadev/splitjoin.vim')        " split/join statements (gS, gJ)
call minpac#add('wincent/terminus')                 " enhancements for terminal vim (focus events, cursor, etc.)

" Git
call minpac#add('tpope/vim-fugitive')               " git integration
call minpac#add('tpope/vim-rhubarb')                " github integration

" Languages & frameworks
call minpac#add('slashmili/alchemist.vim')          " Elixir support
call minpac#add('aklt/plantuml-syntax')             " PlantUML support
call minpac#add('sheerun/vim-polyglot')             " syntax support for common file types
source ~/.vim/startup/plugin/vim-ruby.vim

" Motions & Operators
call minpac#add('tpope/vim-surround')               " alter surroundings (), [], '', {}
call minpac#add('tommcdo/vim-exchange')             " text exchange operator (cx..)
call minpac#add('vim-scripts/ReplaceWithRegister')  " replace without yanking operator (gr..)
call minpac#add('tpope/vim-abolish')                " coercion related commands and operators (crs: snake_case, crm:MixedCase, crc: camelCase, cru: UPPER_CASE, cr-: dash-case, cr.: dot.case, cr<space>: space case)
call minpac#add('tpope/vim-commentary')             " un/comment code (gc)
call minpac#add('christoomey/vim-system-copy')      " copy command (cp), copy current line (cP) and paste in next line (cv)
call minpac#add('tommcdo/vim-lion')                 " code align operator (gl)
source ~/.vim/startup/plugin/vim-lion.vim

" Text objects
call minpac#add('michaeljsmith/vim-indent-object')     " indentation based text object <i/I>
call minpac#add('b4winckler/vim-angry')                " function argument text object <a/A>
call minpac#add('Julian/vim-textobj-variable-segment') " segments of camelCase, snake_case and similar <v>
call minpac#add('vim-utils/vim-space')                 " whitespace, empty line text objects <space>
call minpac#add('glts/vim-textobj-comment')            " comments ac,ic (with,without delimiters like /* */)

" Look & Feel
call minpac#add('danielwe/base16-vim')          " base16 color schemes

" Navigation
call minpac#add('junegunn/fzf')                      " basic FZF support
call minpac#add('junegunn/fzf.vim')                  " FZF helpers
call minpac#add('bronson/vim-visual-star-search')    " search visual selected text with '*'
call minpac#add('dietsche/vim-lastplace')            " restore cursor position when re-opening files
call minpac#add('pgdouyon/vim-evanesco')             " improved (*) search
call minpac#add('misterbuckley/vim-definitive')      " grep for variable/function definitions

" Auto completion
call minpac#add('tpope/vim-endwise')                " auto close for Vim blocks
call minpac#add('jiangmiao/auto-pairs')             " auto close for (, [, {

" Third party integration
call minpac#add('christoomey/vim-tmux-navigator')   " navigate to tmux panes from Vim
call minpac#add('rizzatti/dash.vim')                " integration with Doc viewer Dash (only MacOS)
call minpac#add('linluk/vim-websearch')             " web searches from vim buffers
source ~/.vim/startup/plugin/vim-websearch.vim

" Runners
call minpac#add('tpope/vim-eunuch')                 " run common UNIX commands for the current file
call minpac#add('tpope/vim-dispatch')               " run commands asynchronously
call minpac#add('benmills/vimux')                   " tmux integration
source ~/.vim/startup/plugin/vimux.vim
call minpac#add('janko-m/vim-test')                 " generic test runner
source ~/.vim/startup/plugin/vim-test.vim

" Extras
source ~/.vim/startup/plugin/netrw.vim              " configuration for netrw

"}}}

" enable filetype detection
filetype on

" enable filetype plugins
filetype plugin on

" enable filetype indentation settings
filetype indent on

" load matchit plugin (shipped with vim)
runtime macros/matchit.vim

source ~/.vim/startup/abbreviations.vim
source ~/.vim/startup/auto_commands.vim
source ~/.vim/startup/commands.vim
source ~/.vim/startup/forced_file_types.vim
source ~/.vim/startup/ignored_patterns.vim
source ~/.vim/startup/look_and_feel.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/text_objects.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/skeletons.vim

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
