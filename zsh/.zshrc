# This file is only loaded for interactive shells
# Check .zshenv for settings used in all shells

# NOTE: For some reason setting CC env var makes zsh load slower

case "$OSTYPE" in
  darwin*)
    # Shells on mac automatically load /etc/profile and this messes with the order
    # of PATH entries. Here we clear up the path and re-set it again.
    if [ -f /etc/profile ]; then
        PATH=""
        source /etc/profile
        source $HOME/.zshenv
    fi
  ;;
esac

# theme
source ~/.zsh/theme.zsh

# locales
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export LC_CTYPE=$LANG

# vim everywhere
bindkey -v
export VISUAL=vim
export EDITOR=vim
export KEYTIMEOUT=15  # reduce delay when changing modes

# even when using man
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -"

# custom functions
source ~/.zsh/custom-functions.zsh

# custom emacs-like bindings (useful on insert mode)
bindkey '^b' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word

# vim-style history navigation
bindkey '^n' up-history
bindkey '^p' down-history

# edit current command with VIM (or whatever $EDITOR is set to)
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line

# altern between foreground/background with Ctrl-z (see custom-functions.zsh)
bindkey '^z' fancy-ctrl-z

# ctrl-r starts searching history backward
bindkey '^r' fzf-search-history

# exit insert mode with kj, like in vim
bindkey -M viins 'kj' vi-cmd-mode

# easier cd into frequent directories
setopt auto_cd
cdpath=($HOME/src)

# enable autocompletion (tab-triggered)
zmodload zsh/complist
autoload -U compinit && compinit

# share history between sessions
setopt share_history

# only one entry per command on history
setopt hist_save_no_dups

# history search should never show a command twice
setopt hist_find_no_dups

# ignore duplicates globally
setopt hist_ignore_all_dups

# remove existing entries, and append new ones
setopt inc_append_history

# ignore commands that start with at least one space
setopt hist_ignore_space

# trim commands before saving them
setopt hist_reduce_blanks

# history entries to keep in history file
export SAVEHIST=10000

# history entries to keep in memory
export HISTSIZE=10000

# history location
export HISTFILE=~/.zsh_history

# commands not added to history
export HISTORY_IGNORE="(ll|clear|c|clear|ls|cd *|pwd|exit|cd ..|rm *|rc|bi|fs|gd|gs|gp|git push|git pull|git fetch|v|cd|pry|dark|light|up|master|co .|..|gl|ots|bpry|git ci|clar|cl4ar|bundle)"

# dont use zle on emacs to aviod duplicated input
if [[ -n ${INSIDE_EMACS} ]]; then
        unsetopt zle
fi

# fix bug when passing arguments to rake
unsetopt nomatch

# enable syntax for cheat (see: https://github.com/chrisallenlane/cheat)
export CHEATCOLORS=true

# source fzf fuzzy finder configuration is present
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source local config if present
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

case `uname` in
  Darwin)
    # enable rbenv
    eval "$(rbenv init -)"
  ;;
  Linux)
    # commands for Linux go here
    eval "$(rbenv init -)"
  ;;
esac
