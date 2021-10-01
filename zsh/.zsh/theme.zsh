# vim: foldmethod=marker foldlevel=0

# Gitstatus {{{

# Load gitstatus plugin
source ${GITSTATUS_DIR}/gitstatus.plugin.zsh || return

# Sets GITSTATUS_PROMPT to reflect the state of the current git repository (empty if not
# in a git repository).
function gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g GITSTATUS_PROMPT=""

  # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  # asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query MY                  || return 1  # error
  [[ $VCS_STATUS_RESULT == ok-sync ]] || return 0  # not a git repo

  local reset='%f'
  local yellow='%F{3}'

  p=$yellow
  p+=${${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT}}//\%/%%}            # escape %

  [[ -n $VCS_STATUS_TAG               ]] && p+="#${VCS_STATUS_TAG//\%/%%}"  # escape %
  [[ $VCS_STATUS_HAS_STAGED      == 1 ]] && p+="+"
  [[ $VCS_STATUS_HAS_UNSTAGED    == 1 ]] && p+="!"
  [[ $VCS_STATUS_HAS_UNTRACKED   == 1 ]] && p+="?"
  [[ $VCS_STATUS_COMMITS_AHEAD  -gt 0 ]] && p+=" ⇡${VCS_STATUS_COMMITS_AHEAD}"
  [[ $VCS_STATUS_COMMITS_BEHIND -gt 0 ]] && p+=" ⇣${VCS_STATUS_COMMITS_BEHIND}"
  [[ $VCS_STATUS_STASHES        -gt 0 ]] && p+=" *${VCS_STATUS_STASHES}"

  GITSTATUS_PROMPT="${reset}${p}${reset}"
}

# Start gitstatusd instance with name "MY". The same name is passed to
# gitstatus_query in gitstatus_prompt_update.
gitstatus_stop MY && gitstatus_start MY

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
autoload -Uz add-zsh-hook
add-zsh-hook precmd gitstatus_prompt_update

# }}}

# Vim mode indicator {{{
vim_ins_mode="$%F{reset_color}"
vim_cmd_mode="•%F{reset_color}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}
# }}}

current_path() {
  echo '%F{4}%~%F{reset_color}'
}

prompt_symbol_with_last_command_status() {
  echo "%-30(l::\n)%(?.%F{reset_color}.%F{red})${vim_mode}"
}

username() {
  echo "%l"
}

hostname() {
  echo "%M"
}

username_and_host_if_server() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "%F{9}%n@%m%F{reset_color} "
  fi
}

setopt prompt_subst
PROMPT='$(username_and_host_if_server)$(current_path)${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT} $(prompt_symbol_with_last_command_status) '

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
