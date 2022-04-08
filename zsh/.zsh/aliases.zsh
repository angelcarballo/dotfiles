### Alias

# OS specific
case "$OSTYPE" in
  darwin*)
    alias copy='pbcopy'
    alias paste='pbpaste'
    alias flushdns='dscacheutil -flushcache'
    alias dark="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to true'"
    alias light="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to false'"
  ;;
  linux*)
    alias copy='xclip -selection clipboard'
    alias paste='xclip -selection clipboard -o'
    alias markoff="open -a Markoff"
    alias open='xdg-open'
  ;;
esac

# Common
alias c='clear'
alias cp='cp -i' # ask before overriding
alias mv='mv -i' # ask before overriding
alias df='df -h' # show human sizes
alias celar='clear'
alias lcear='clear'
alias ls='ls -GFa --color=auto'
alias ll='ls -GFlah --color=auto'
alias cat='bat'

# Extension based aliases, they are used when the filename is used as a command
alias -s log='tail -f'
alias -s csv='column -s, -t'

# Ruby/Rails
alias bus='bundle update --source'
alias brake='bundle exec rake'
alias bi='bundle install'
alias be='bundle exec'
alias ber='bundle exec rspec --color'
alias berf='bundle exec rspec --color --fail-fast'
alias bpry='bundle exec pry'

# Elixir
alias mdg='mix deps.get'
alias iexm='iex -S mix'

# Git
alias clone='git clone'
alias fetch='git fetch'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias pushf='git push --force-with-lease'
alias rebase='git rebase'
alias stash='git stash'
alias stashd='git stash show -p'
alias pop='git stash pop'
alias recent='git recent'
alias prfiles='gh prfiles'

alias br='git co $(git branch -a --no-color | fzf)' # fuzzy find branch
alias cb='git rev-parse --abbrev-ref HEAD | copy'
alias co='git checkout '
alias gap='git add --patch '
alias gb='git branch'
alias gc='git commit'
alias gca='git clean -d'
alias gcb='git checkout -b'
alias gcm='git commit -m '
alias gd='git diff'
alias gdh='git diff HEAD'
alias gdm='git diff origin/main'
alias gf='git fetch'
alias gg='git browse-remote --pr'
alias ggd='open `hub browse -u | sed s/\tree.*//g`/compare/`git rev-parse --abbrev-ref HEAD`'
alias gitfiles='git ls-files --modified --others --exclude-standard'
alias gj='git jump'
alias gjm='git jump merge'
alias gl="git log --pretty=oneline"
alias gma="git merge --abort"
alias gp='git pull'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grh='git reset --hard '
alias grhm='git reset --hard origin/main'
alias grho='git reset --hard origin/`git rev-parse --abbrev-ref HEAD`'
alias gri='git rebase -i'
alias grom='git rebase origin/main'
alias grs='git restore --staged '
alias gs='git status -uall'
alias gsearch='git log --source --all -S'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gw='git worktree'
alias gwl='git worktree list'
alias modified='git ls-files --modified'
alias untracked='git ls-files --others --exclude-standard'

# Npm/Node
alias ni='npm install'

# Vim
alias v='nvim'
alias vim='nvim'
alias vv='nvim `gitfiles`'
alias nv='nvim'

# Emacs
alias ec='emacsclient -nw'
alias e='emacsclient -nw .'

# Python
alias python='python3'
alias pip='pip3'

# Notes/tasks
alias n='vim `find $NOTES -name "*.md" | sort | fzf --preview "cat {}"`'
alias nn='vim $NOTES/00-sandbox.md'
alias j='vim $NOTES/01-journal.md'
alias t='task'

# Gron
alias ungron gron --ungron

# Use a generic TERM for ssh connections, they probably don't support tmux-xxx
alias ssh='TERM=xterm-256color ssh'
