### Alias

# Comunes
alias c='clear'
alias celar='clear'
alias lcear='clear'
alias ls='ls -GFa'
alias ll='ls -GFlah'

# Atajos Mac
alias flushdns='dscacheutil -flushcache'

# Ruby/Rails
alias bus='bundle update --source'
alias brake='bundle exec rake'
alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rspec --color'
alias bers='bundle exec spring rspec --color'
alias berf='bundle exec rspec --color --fail-fast'
alias rs='bundle exec rails server -b 0.0.0.0'
alias rc='bundle exec rails console'
alias rg='bundle exec rails generate '
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias deploy='bundle exec cap deploy'
alias deploym='bundle exec cap deploy:migrate'

# Git
alias ga='git add -A .'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m '
alias gcb='git checkout -b'
alias gclean='git clean -fd'
alias gcm='git commit -m '
alias gco='git checkout '
alias gd='git diff'
alias gdh='git diff HEAD'
alias gf='git fetch'
alias gl='git log --oneline --decorate --graph --all'
alias gll="git log --pretty=format:'%h - %an [%ar] %s'"
alias go='git open'
alias gom='git open origin master'
alias gp='git pull'
alias gps='git push'
alias gmm='git pull && git merge origin/master'
alias gr='git reset HEAD '
alias grh='git reset --hard HEAD'
alias grl='git reflog'
alias gst='git stash'
alias gs='git status'
alias gsc='git log -S '
alias gsm='git log -E -i --grep '
alias gsp='git stash pop'

# Docker & boot2docker
alias dockerenv='eval `boot2docker shellinit 2>/dev/null`'

# Vim
alias vim='/usr/local/bin/vim'
alias v='vim .'

# colorschemes
alias dark='color tomorrow-night'
alias light='color solarized-light'

