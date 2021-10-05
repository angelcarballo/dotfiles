#!/bin/bash

if [ "$DARKMODE" == "1" ]; then
  sed -i'' -e 's/light_theme/dark_theme/' ~/.config/alacritty/alacritty.yml
else
  sed -i'' -e 's/dark_theme/light_theme/' ~/.config/alacritty/alacritty.yml
fi
