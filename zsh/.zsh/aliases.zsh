### Alias

# Common
alias c='clear'
alias celar='clear'
alias lcear='clear'
alias ls='ls -GFa --color=auto'
alias ll='ls -GFlah --color=auto'
alias catcsv='column -s, -t '
alias cat='bat'
alias update='git pull && bundle install'

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
alias bpry='bundle exec pry'
alias up='git pull && bundle'

# Git
alias br='branch' # custom zsh function
alias co='git checkout '
alias gco='git checkout '
alias gb='git branch'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcm='git commit -m '
alias gd='git diff'
alias gdh='git diff HEAD'
alias gdm='git diff origin/master'
alias gf='git fetch'
alias gl='git log --oneline --decorate --graph --all'
alias gll="git log --pretty=format:'%h - %an [%ar] %s'"
alias gma="git merge --abort"
alias gbr='git browse'
alias gp='git pull'
alias gr='git review'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gs='git status -uall'
alias gsl='git stash list'
alias gsp='git stash pop'
alias master='git checkout master'
alias cb='git rev-parse --abbrev-ref HEAD | pbcopy'
alias fetchall='ls -d ~/src/*/ | xargs -I{} git -C {} fetch'
alias ghd='open `hub browse -u | sed s/\tree.*//g`/compare/`git rev-parse --abbrev-ref HEAD`'
alias modified='git ls-files --modified'
alias untracked='git ls-files --others --exclude-standard'
alias gitfiles='git ls-files --modified --others --exclude-standard'
alias gj='git jump diff'
alias grh='git reset --hard '
alias gap='git add --patch '
alias pr='gh pr view'
alias gsearch='git log --source --all -S'

# Vim
alias v='vim .'

# Emacs
alias ec='emacsclient -nw'
alias e='emacsclient -nw .'

# Colorschemes
alias dark='base16_monokai'
alias light='base16_solarized-light'

# Python
alias python='python3'
alias pip='pip3'

# Elixir
alias iex='rlwrap -a foo iex'
alias miex='rlwrap -a foo iex -S mix'

# Notes/tasks
alias n='vim `find $NOTES -name "*.md" | sort | fzf --preview "cat {}"`'
alias nn='vim $NOTES/00-sandbox.md'
alias j='vim $NOTES/01-journal.md'
alias t='task'

# Call Markoff (markdown mac preview) from the shell
alias markoff="open -a Markoff"
