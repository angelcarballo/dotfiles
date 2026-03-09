# vim: foldmethod=marker foldlevel=0

current_path() {
  echo '%F{7}%~%F{reset_color}'
}

prompt_symbol_with_last_command_status() {
  echo "%-30(l::\n)%(?.%F{reset_color}.%F{red}) $"
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
PROMPT='$(username_and_host_if_server)$(current_path)$(prompt_symbol_with_last_command_status)%F{reset_color} '
