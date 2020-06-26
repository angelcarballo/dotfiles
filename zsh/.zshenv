# This file is loaded for all shells
# Check .zshrc for settings used on interactive shells

# Personal binary folders
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$PATH"

case "$OSTYPE" in
  darwin*)
    # GNU Coreutils
    export PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"

    # Homebrew
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
  ;;
esac

# Rust's Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Aliases
source ~/.zsh/aliases.zsh

# Notes
export NOTES="$HOME/Drive/notes"

# FZF settings
export FZF_DEFAULT_OPTS=' --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_COMPLETION_TRIGGER='ff'

# Used to show git information on zsh prommpt
export GITSTATUS_DIR="$HOME/src/gitstatus"

# Make path entries unique
export -U PATH
