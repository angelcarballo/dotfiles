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
  local green='%F{010}'
  local yellow='%F{011}'

  local p
  if (( VCS_STATUS_HAS_STAGED || VCS_STATUS_HAS_UNSTAGED || VCS_STATUS_HAS_UNTRACKED )); then
    p+=$yellow
  else
    p+=$green
  fi
  p+=${${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT}}//\%/%%}            # escape %

  [[ -n $VCS_STATUS_TAG               ]] && p+="#${VCS_STATUS_TAG//\%/%%}"  # escape %
  [[ $VCS_STATUS_HAS_STAGED      == 1 ]] && p+="${yellow}+"
  [[ $VCS_STATUS_HAS_UNSTAGED    == 1 ]] && p+="${yellow}!"
  [[ $VCS_STATUS_HAS_UNTRACKED   == 1 ]] && p+="${yellow}?"
  [[ $VCS_STATUS_COMMITS_AHEAD  -gt 0 ]] && p+="${green} ⇡${VCS_STATUS_COMMITS_AHEAD}"
  [[ $VCS_STATUS_COMMITS_BEHIND -gt 0 ]] && p+="${green} ⇣${VCS_STATUS_COMMITS_BEHIND}"
  [[ $VCS_STATUS_STASHES        -gt 0 ]] && p+="${green} *${VCS_STATUS_STASHES}"

  GITSTATUS_PROMPT="${reset}${p}${reset}"
}

# Start gitstatusd instance with name "MY". The same name is passed to
# gitstatus_query in gitstatus_prompt_update.
gitstatus_stop MY && gitstatus_start MY

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
autoload -Uz add-zsh-hook
add-zsh-hook precmd gitstatus_prompt_update

current_path() {
  echo '%F{12}%~%F{reset_color}'
}

prompt_symbol_with_last_command_status() {
  echo "%-30(l::\n)%(?.%F{white}.%F{red})$%F{reset_color}"
}

username() {
  echo "%l"
}

hostname() {
  echo "%M"
}

username_and_host_if_server() {
  case `uname` in
    Darwin)
      ;;
    Linux)
      # Full user (%n) and short hostname (%m)
      echo "%F{12}%n@%m:%F{reset_color}"
      ;;
  esac
}

setopt prompt_subst
PROMPT='$(username_and_host_if_server)$(current_path)${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT} $(prompt_symbol_with_last_command_status) '

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
