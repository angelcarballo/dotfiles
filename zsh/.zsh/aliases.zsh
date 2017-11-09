### Alias

# Fancy stuff
alias morning='tmuxinator start dotfiles'

# Common
alias c='clear'
alias celar='clear'
alias lcear='clear'
alias ls='ls -GFa'
alias ll='ls -GFlah'

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
alias rs='bundle exec rails server -b 0.0.0.0'
alias rc='bundle exec rails console'
alias rk='bundle exec rackup'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias deploy='bundle exec cap deploy'
alias deploym='bundle exec cap deploy:migrate'
alias expected='grep -A1 -B1 expected'

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
alias gh='git open'
alias gom='git open origin master'
alias gp='git pull'
alias gmm='git pull && git merge origin/master'
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

# Jekyll
alias js='bundle exec jekyll serve --watch'

# Docker & boot2docker
alias dockerenv='eval `boot2docker shellinit 2>/dev/null`'

# Vim
alias vim='/usr/local/bin/vim'
alias v='nvim .'

# Emacs
alias ec='emacsclient -nw'
alias e='emacsclient -nw .'

# Colorschemes
alias dark='color gruvbox-dark-hard'
alias light='color gruvbox-light-hard'
alias cnext='color -n'
alias cprev='color -p'
