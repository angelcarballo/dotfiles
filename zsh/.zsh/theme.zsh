########### Prompt (based on: https://github.com/sindresorhus/pure) ###########

autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '∙'
zstyle ':vcs_info:*' unstagedstr '∙'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '@%b%c%u'

theme_precmd() {
  vcs_info
}

current_path() {
  echo '%F{blue}%~%F{reset_color}'
}

current_branch() {
  echo "%F{yellow}${vcs_info_msg_0_}%F{reset_color}"
}

prompt_symbol_with_last_command_status() {
  echo "%(?.%F{white}.%F{red})>%F{reset_color}"
}

setopt prompt_subst
PROMPT='$(current_path) $(current_branch) $(prompt_symbol_with_last_command_status) '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
