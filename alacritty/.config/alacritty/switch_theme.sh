#!/bin/bash

if [ "$DARKMODE" == "1" ]; then
  tmux source-file ~/.tmux/local_dark.theme
  sed -i '' 's/light_theme/dark_theme/' ~/.config/alacritty/alacritty.yml
else
  tmux source-file ~/.tmux/local_light.theme
  sed -i '' 's/dark_theme/light_theme/' ~/.config/alacritty/alacritty.yml
fi
