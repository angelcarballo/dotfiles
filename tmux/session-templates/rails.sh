#!/bin/bash

SESSIONNAME="mstore"
tmux has-session -t $SESSIONNAME > /dev/null

if [ $? != 0  ]
then
  # new session with name $SESSIONNAME and window 1 named "code"
  tmux new-session -s $SESSIONNAME -n code -d
  tmux send-keys 'cd ~/src/$SESSIONNAME && vim .' 'C-m'

  # window 2 for server
  tmux new-window -t $SESSIONNAME:2 -n "server"
  tmux send-keys 'cd ~/src/$SESSIONNAME && bundle exec rails server' 'C-m'
  
  # window 3 for console
  tmux new-window -t $SESSIONNAME:3 -n "console"
  tmux send-keys 'cd ~/src/$SESSIONNAME' 'C-m'

  # switch the "code" window
  tmux select-window -t $SESSIONNAME:1
fi

tmux attach -t $SESSIONNAME
