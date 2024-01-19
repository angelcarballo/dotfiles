#!/bin/bash

if [ "$DARKMODE" == "1" ]; then
  sed -i '' 's/light_theme/dark_theme/' ~/.config/alacritty/alacritty.toml
else
  sed -i '' 's/dark_theme/light_theme/' ~/.config/alacritty/alacritty.toml
fi
