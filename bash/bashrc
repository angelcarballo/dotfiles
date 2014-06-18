### Modo VIM en cosola
set -o vi

### Alias

# Comunes
alias c='clear'
alias ll='ls -l'
alias ll='ls -l'

# Atajos Mac
alias flushdns='dscacheutil -flushcache'

# Rails
alias be='bundle exec'
alias rs='bundle exec rails s --debugger'
alias rc='bundle exec rails c'

# Enable rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi # Enable shims and autocompletion add to your profile:
eval "$(rbenv init -)" # enable rbenv


# Ruby
export RUBYOPT=-Ku

# Colores varios
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Colores prompt
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE='\e[0;37m'

# Parseo de rama git
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# Prompt
PS1="$WHITE\w$YELLOW\$(parse_git_branch)$WHITE $ "

