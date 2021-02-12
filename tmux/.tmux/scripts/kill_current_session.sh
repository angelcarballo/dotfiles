#!/bin/bash

kill_current_session() {
  session=$(tmux display-message -p "#S")

  # switch to next session when present
  if [ $(tmux list-sessions | wc -l) > 1 ]; then
    tmux switch-client -n
  fi

  tmux kill-session -t $session
}

kill_current_session
