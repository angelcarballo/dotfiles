" initialize plugin manager
packadd minpac
call minpac#init()

"{{{ Plugins

" Bundled with vim
packadd cfilter                                        " filter entries from quickfix or location lists

" Basic plugins
call minpac#add('kana/vim-textobj-user')               " custom text object support
call minpac#add('tpope/vim-repeat')                    " extend repeat support
call minpac#add('AndrewRadev/splitjoin.vim')           " split/join statements (gS, gJ)
call minpac#add('wincent/terminus')                    " enhancements for terminal vim (focus events, cursor, etc.)

" Git
call minpac#add('tpope/vim-fugitive')                  " git integration
call minpac#add('tpope/vim-rhubarb')                   " github integration

" Languages & frameworks
call minpac#add('tpope/vim-rbenv')                     " Rbenv support, used to get the current ruby version on `path`
call minpac#add('tpope/vim-bundler')                   " Bundler support, used to get the current bundled gems on `path`
call minpac#add('elixir-editors/vim-elixir')           " Elixir support
call minpac#add('aklt/plantuml-syntax')                " PlantUML support
call minpac#add('kchmck/vim-coffee-script')            " Coffeescript support

" Operators
call minpac#add('tpope/vim-surround')                  " alter surroundings (), [], '', {}
call minpac#add('tommcdo/vim-exchange')                " text exchange operator (cx..)
call minpac#add('vim-scripts/ReplaceWithRegister')     " replace without yanking operator (gr..)
call minpac#add('tpope/vim-commentary')                " un/comment code (gc)
call minpac#add('tommcdo/vim-lion')                    " code align (gl)
runtime startup/plugin/vim-lion.vim

" Text objects
call minpac#add('michaeljsmith/vim-indent-object')     " indentation based text object <ai>, <ii>
call minpac#add('Julian/vim-textobj-variable-segment') " segments of camelCase, snake_case and similar <av>, <iv>
call minpac#add('glts/vim-textobj-comment')            " comments text object <ic>, <ac>, <aC> to include whitespace

" Look & Feel
call minpac#add('romainl/vim-cool')                    " clear search highlight automatically
call minpac#add('romainl/Apprentice')                  " Apprentice colorscheme

" Navigation
call minpac#add('junegunn/fzf')                        " basic FZF support
call minpac#add('junegunn/fzf.vim')                    " FZF helpers
call minpac#add('romainl/vim-devdocs')                 " search documentation on DevDocs
call minpac#add('ludovicchabant/vim-gutentags')        " auto generate and update tags

" Auto completion
call minpac#add('AndrewRadev/switch.vim')              " switch between pre-defined patterns (as in true/false)
runtime startup/plugin/switch.vim
call minpac#add('tpope/vim-endwise')                   " auto close do/end blocks and similar
call minpac#add('alvan/vim-closetag')                  " auto close html/xml tags
runtime startup/plugin/vim-closetag.vim

" Runners
call minpac#add('benmills/vimux')                      " tmux integration
runtime startup/plugin/vimux.vim
call minpac#add('janko-m/vim-test')                    " generic test runner
runtime startup/plugin/vim-test.vim
call minpac#add('junegunn/vader.vim')                  " vimscript test framework

" Extras
runtime startup/plugin/netrw.vim                 " configuration for netrw
runtime startup/plugin/vim-ruby.vim              " configuration for default vim-ruby

"}}}

filetype plugin indent on  " enable filetype detection, plugins and indentation
runtime macros/matchit.vim " match closing pairs
runtime ftplugin/man.vim   " open man documentation

runtime startup/globals.vim
runtime startup/abbreviations.vim
runtime startup/auto_commands.vim
runtime startup/commands.vim
runtime startup/forced_file_types.vim
runtime startup/ignored_patterns.vim
runtime startup/look_and_feel.vim
runtime startup/mappings.vim
runtime startup/text_objects.vim
runtime startup/settings.vim
runtime startup/skeletons.vim
