########################################################
# This file is loaded for all shells.                  #
# Check .zshrc for settings used on interactive shells #
########################################################

# Aliases
source ~/.zsh/aliases.zsh

# Personal binary folders
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Notes
export NOTES="$HOME/Dropbox/notes"

# FZF defaults
export FZF_DEFAULT_OPTS=' --layout=reverse'

# GNU Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"
