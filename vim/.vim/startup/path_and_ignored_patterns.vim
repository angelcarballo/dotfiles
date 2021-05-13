" System include folder is added by default, no need for it
set path-=/usr/include

" Generic folders (ruby, elixir, etc...)
set path+=lib/**,app/**,spec/**,test/**,config/**,bin/**,scripts/**,priv/**

" Generic folders (elixir umbrella)
set path+=apps/*/lib/**,apps/*/test/**,apps/*/config/**,apps/*/scripts/**,apps/*/priv/**

" Elixir/Phoenix
set path+=assets/*,assets/js/**,assets/css/**,assets/static/**,assets/vendor/**

set wildignore+=*.swp,*.bak,*.pyc,*.class              " Common
set wildignore+=*/tmp/*,*.so,*.zip,.DS_Store           " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.zip,*.exe                  " Windows
set wildignore+=*/temp/*,*/backup/*                    " Vim
set wildignore+=*/_site/*                              " Jekyll
set wildignore+=*/log/*,*.log                          " log files
set wildignore+=*.eof,*.ttf,*.woff                     " font files
set wildignore+=**/node_modules/**                     " node artefacts
