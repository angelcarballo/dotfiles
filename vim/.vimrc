" initialize plugin manager
packadd minpac
call minpac#init()

"{{{ Plugins

" Basic plugins
call minpac#add('kana/vim-textobj-user')            " custom text object support
call minpac#add('tpope/vim-repeat')                 " extend repeat support
call minpac#add('AndrewRadev/splitjoin.vim')        " split/join statements (gS, gJ)
call minpac#add('wincent/terminus')                 " enhancements for terminal vim (focus events, cursor, etc.)

" Git
call minpac#add('tpope/vim-fugitive')               " git integration
call minpac#add('tpope/vim-rhubarb')                " github integration

" Languages & frameworks
call minpac#add('tpope/vim-rbenv')                  " Rbenv support, used to get the current ruby version on `path`
call minpac#add('tpope/vim-bundler')                " Bundler support, used to get the current bundled gems on `path`
call minpac#add('elixir-editors/vim-elixir')        " Elixir support
call minpac#add('slashmili/alchemist.vim')          " Elixir intellisense support
call minpac#add('aklt/plantuml-syntax')             " PlantUML support
call minpac#add('masukomi/vim-markdown-folding')    " folding support for makrdown files
call minpac#add('kchmck/vim-coffee-script')         " Coffeescript support

" Operators
call minpac#add('tpope/vim-surround')               " alter surroundings (), [], '', {}
call minpac#add('tommcdo/vim-exchange')             " text exchange operator (cx..)
call minpac#add('vim-scripts/ReplaceWithRegister')  " replace without yanking operator (gr..)
call minpac#add('tpope/vim-commentary')             " un/comment code (gc)
call minpac#add('tommcdo/vim-lion')                 " code align operator (gl)
source ~/.vim/startup/plugin/vim-lion.vim

" Text objects
call minpac#add('michaeljsmith/vim-indent-object')     " indentation based text object <ai>, <ii>
call minpac#add('b4winckler/vim-angry')                " function argument text object <aa>, <ia>
call minpac#add('Julian/vim-textobj-variable-segment') " segments of camelCase, snake_case and similar <av>, <iv>
call minpac#add('glts/vim-textobj-comment')            " comments <ac>, <ic>

" Look & Feel
call minpac#add('danielwe/base16-vim')          " base16 color schemes
call minpac#add('romainl/vim-cool')             " clear search highlight automatically

" Navigation
call minpac#add('junegunn/fzf')                      " basic FZF support
call minpac#add('junegunn/fzf.vim')                  " FZF helpers
call minpac#add('romainl/vim-devdocs')               " search documentation via devdocs.io

" Auto completion
call minpac#add('tmsvg/pear-tree')             " auto close parenthesis/brackets/quotes
source ~/.vim/startup/plugin/pear-tree.vim

" Runners
call minpac#add('benmills/vimux')                   " tmux integration
source ~/.vim/startup/plugin/vimux.vim
call minpac#add('janko-m/vim-test')                 " generic test runner
source ~/.vim/startup/plugin/vim-test.vim

" Extras
source ~/.vim/startup/plugin/netrw.vim              " configuration for netrw
source ~/.vim/startup/plugin/vim-ruby.vim           " configuration for default vim-ruby

"}}}

filetype plugin indent on  " enable filetype and indentation plugins
runtime macros/matchit.vim " load matchit plugin (shipped with vim)

" add OS global var
if !exists('g:os')
  if has('win32') || has('win16')
    let g:os = 'Windows'
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

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
