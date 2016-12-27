# load Antigen plugin manager
source ~/.zsh/antigen.zsh

# antigen Bundles
antigen bundle git-extras                          # extra git commands
antigen bundle ssh-agent                           # For SSH, starting ssh-agent is annoying

# OS specific bundles
if [[ $CURRENT_OS == 'OS X' ]]; then
  antigen bundle brew
fi

# tell antigen that you're done.
antigen apply

# theme
source ~/.zsh/theme.zsh

# aliases
source ~/.zsh/aliases.zsh

# vim everywhere
bindkey -v
export VISUAL=vim
export EDITOR=vim
export KEYTIMEOUT=1  # reduce delay when changing modes

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

# edit current command with VIM (or whatever $EDITOR is set to)
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line

# altern between foreground/background with Ctrl-z (see custom-functions.zsh)
bindkey '^z' fancy-ctrl-z

# ctrl-r starts searching history backward
bindkey '^r' fzf-search-history

# repeat last command
bindkey -s '^f' "!!\n"

# cycle colors
bindkey -s '^]' "color -n\n"
bindkey -s '^[' "color -p\n"

# easier cd into frequent directories
setopt auto_cd
cdpath=($HOME/src)

# history settings
setopt share_history         # share history between sessions
setopt hist_save_no_dups     # only one entry per command on history
setopt hist_find_no_dups     # history search should never show a command twice
setopt hist_ignore_all_dups  # ignore duplicates globally
setopt inc_append_history    # remove existing entries, and append new ones
setopt hist_ignore_space     # ignore commands that start with at least one space
setopt hist_reduce_blanks    # trim commands before saving them
SAVEHIST=10000               # history entries to keep in history file
HISTSIZE=10000               # history entries to keep in memory
HISTFILE=~/.zsh_history      # history location
HISTORY_IGNORE="(ll|clear|c|clear|ls|cd *|pwd|exit|cd ..|rm *)"

# vman - vim man pager, with autocompletion
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0"  ]; then
    echo "No manual entry for $*"
  fi
}
compdef vman="man"

# paths common to all platforms
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$HOME/.rbenv/bin:$PATH"

# fix bug when passing arguments to rake
unsetopt nomatch

# ensure there is a valid temp dir for vim
if [[ ! -d "$TMPDIR"  ]]; then
  export TMPDIR="/tmp/`whoami`"
  mkdir -p -m 700 "$TMPDIR"
fi

# enable rbenv
eval "$(rbenv init -)"

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

# enable syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
