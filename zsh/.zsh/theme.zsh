
########### Prompt (based on: https://github.com/sindresorhus/pure) ###########

autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '∙'
zstyle ':vcs_info:*' unstagedstr '∙'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '@%b%c%u%B'

theme_precmd() {
  vcs_info
}

current_path() {
  echo '%B%F{blue}%~'
}

prompt_symbol_with_last_command_status() {
  echo "%(?.%{$reset_color%}.%{$fg[red]%})❯%{$reset_color%}"
}

setopt prompt_subst
PROMPT='$(current_path) %B%F{yellow}${vcs_info_msg_0_}%B%F{yellow} %{$reset_color%}% $(prompt_symbol_with_last_command_status) '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
