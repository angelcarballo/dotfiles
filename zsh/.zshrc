# load zplug plugin manager
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "paulirish/git-open"

# install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# then, source plugins and add commands to $PATH
zplug load

# dont use zle on emacs to aviod duplicated input
if [[ -n ${INSIDE_EMACS} ]]; then
    unsetopt zle
fi

# theme
source ~/.zsh/theme.zsh

# aliases
source ~/.zsh/aliases.zsh

# vim everywhere
bindkey -v
export VISUAL=vim
export EDITOR=vim
export KEYTIMEOUT=15  # reduce delay when changing modes

# base16 color scripts
export COLORS=$HOME/.config/base16-shell/scripts
export SHELL_COLORSCHEME=$HOME/.colorscheme
export VIM_COLORSCHEME=$HOME/.vim_colorscheme

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

# repeat last command
bindkey -s '^g' "!!\n"

# exit insert mode with kj, like in vim
bindkey -M viins 'kj' vi-cmd-mode

# easier cd into frequent directories
setopt auto_cd
cdpath=($HOME/src)

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
SAVEHIST=10000

# history entries to keep in memory
HISTSIZE=10000

# history location
HISTFILE=~/.zsh_history

# commands not added to history
HISTORY_IGNORE="(ll|clear|c|clear|ls|cd *|pwd|exit|cd ..|rm *|rc|bi|fs|gd|gs|gp|git push|git pull|git fetch|v|cd|pry|dark|light)"

# use vim as man pager, with autocompletion
man() {
  vim -c "SuperMan $*"

  if [ "$?" != "0"  ]; then
    echo "No manual entry for $*"
  fi
}
compdef man="man"

# paths common to all platforms
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Python (homebrew version)
export PATH="/usr/local/opt/python/libexec/bin:$PATH"


# fix bug when passing arguments to rake
unsetopt nomatch

# source local config if present
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# source fzf fuzzy finder configuration is present
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# try to use Ag as default fzf command
export FZF_DEFAULT_COMMAND='ag -g ""'

# enable syntax for cheat (see: https://github.com/chrisallenlane/cheat)
export CHEATCOLORS=true

# initialize base16 colorscheme
source $SHELL_COLORSCHEME

# enable rbenv
eval "$(rbenv init -)"

