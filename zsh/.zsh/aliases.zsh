### Alias

# Fancy stuff
alias morning='tmuxinator start dotfiles'

# Common
alias c='clear'
alias celar='clear'
alias lcear='clear'
alias ls='ls -GFa --color=auto'
alias ll='ls -GFlah --color=auto'
alias catcsv='column -s, -t '

# Extension based aliases
alias -s log='tail -f'

# MacOS
alias flushdns='dscacheutil -flushcache'

# Ruby/Rails
alias bus='bundle update --source'
alias brake='bundle exec rake'
alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rspec --color'
alias berf='bundle exec rspec --color --fail-fast'
alias fs='foreman start'
alias rs='DISABLE_SPRING=true bundle exec rails server -b 0.0.0.0'
alias rc='DISABLE_SPRING=true bundle exec rails console'
alias rk='bundle exec rackup'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias deploy='bundle exec cap deploy'
alias deploym='bundle exec cap deploy:migrate'
alias expected='grep -A1 -B1 expected'
alias bpry='bundle exec pry'
alias up='git pull && bundle'

# Git
alias ga='git add -A .'
alias gap='git add -p .'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m '
alias gcb='git checkout -b'
alias gclean='git clean -fd'
alias gcm='git commit -m '
alias gco='git checkout '
alias co='git checkout '
alias gd='git diff'
alias gdh='git diff HEAD'
alias gf='git fetch'
alias gl='git log --oneline --decorate --graph --all'
alias gll="git log --pretty=format:'%h - %an [%ar] %s'"
alias gh='git browse'
alias gp='git pull'
alias gr='git reset HEAD '
alias grh='git reset --hard HEAD'
alias grl='git reflog'
alias gst='git stash'
alias gs='git status -uall'
alias gsc='git log -S '
alias gsm='git log -E -i --grep '
alias gsp='git stash pop'
alias br='branch'
alias master='git checkout master'
alias cb='git rev-parse --abbrev-ref HEAD | pbcopy'
alias gitsecrets='git secrets --install && git secrets --register-aws'
alias fetchall='ls -d ~/src/*/ | xargs -I{} git -C {} fetch'
alias ghd='open `hub browse -u | sed s/\tree.*//g`/compare/`git rev-parse --abbrev-ref HEAD`'
alias amend='git commit --amend'
alias prfiles='git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD master)'

# Jekyll
alias js='bundle exec jekyll serve --watch'

# Docker & boot2docker
alias dockerenv='eval `boot2docker shellinit 2>/dev/null`'

# Vim
alias vim='/usr/local/bin/vim'
alias v='vim .'

# Emacs
alias ec='emacsclient -nw'
alias e='emacsclient -nw .'

# Colorschemes
alias dark='color monokai'
alias light='color solarized-light'
alias cnext='color -n'
alias cprev='color -p'

# Python
alias python='python3'
alias pip='pip3'

# Elixir
alias iex='rlwrap -a foo iex'
alias miex='rlwrap -a foo iex -S mix'

# Notes
alias nn='vim $NOTES'
alias n='vim $NOTES/00-sandbox.md'
alias j='vim $NOTES/01-journal.md'
