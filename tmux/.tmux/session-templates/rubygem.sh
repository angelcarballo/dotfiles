#!/bin/bash

PROJECT=$(basename $(pwd)) # last part of current folder path
tmux has-session -t $PROJECT > /dev/null

if [ $? != 0  ]
then
  # new session with name $PROJECT and window 1 named "code"
  tmux new-session -s $PROJECT -n code -d
  tmux send-keys 'cd ~/src/$PROJECT && vim .' 'C-m'

  # window 2 for tests
  tmux new-window -t $PROJECT:2 -n "test"
  tmux send-keys 'cd ~/src/$PROJECT && bundle exec guard' 'C-m'

  # window 3 for console
  tmux new-window -t $PROJECT:3 -n "console"
  tmux send-keys 'cd ~/src/$PROJECT && bundle exec rake console' 'C-m'

  # switch the "code" window
  tmux select-window -t $PROJECT:1
fi

tmux attach -t $PROJECT
