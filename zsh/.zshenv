# This file is loaded for all shells
# Check .zshrc for settings used on interactive shells

# Personal binary folders
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$PATH"

case "$OSTYPE" in
  darwin*)
    # GNU Coreutils, put them **after** since some scripts require the default versions shipped with MacOs
    # All the duplicated GNU binaries can be accessed with g-prefixed commands: mktemp -> gmktemp
    export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin/"

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
export FZF_COMPLETION_TRIGGER=';;'

# Used to show git information on zsh prommpt
export GITSTATUS_DIR="$HOME/src/gitstatus"

# Make path entries unique
export -U PATH

# Include go binaries in path
export PATH=$PATH:$GOBIN

# Enable syntax for cheat (see: https://github.com/chrisallenlane/cheat)
export CHEATCOLORS=true

# enable shell history on IEx and increase history size
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

