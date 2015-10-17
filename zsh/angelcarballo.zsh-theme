# based on: https://github.com/sindresorhus/pure

autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats ' (%b%c%u%B)'

theme_precmd () {
  vcs_info
}

setopt prompt_subst
PROMPT='%B%F{blue}%~%B%F{yellow}${vcs_info_msg_0_}%B%F{yellow} %{$reset_color%}% ❯ '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
