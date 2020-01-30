# This file is loaded for all shells
# Check .zshrc for settings used on interactive shells

# Personal binary folders
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$PATH"

# GNU Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin/:$PATH"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Rust's Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Aliases
source ~/.zsh/aliases.zsh

# Notes
export NOTES="$HOME/Synology/notes"

# FZF settings
export FZF_DEFAULT_OPTS=' --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# Used for git review alias, it indicates the BASE branch for a merge or rebase
export REVIEW_BASE="origin/master"

# Used to show git information on zsh prommpt
export GITSTATUS_DIR="$HOME/src/gitstatus"

# Make path entries unique
export -U PATH
