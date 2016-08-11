# # Load Antigen
source ~/.zsh/antigen.zsh

# Antigen Bundles
antigen bundle git-extras                          # extra git commands
antigen bundle ssh-agent                           # For SSH, starting ssh-agent is annoying

# OS specific bundles
if [[ $CURRENT_OS == 'OS X' ]]; then
  antigen bundle brew
fi

# Tell antigen that you're done.
antigen apply

# Theme
source ~/.zsh/theme.zsh

# Aliases
source ~/.zsh/aliases.zsh

# Vim everywhere
bindkey -v
export VISUAL=vim
export EDITOR=vim
export KEYTIMEOUT=1  # reduce delay when changing modes

# Custom functions
source ~/.zsh/custom-functions.zsh

# Custom emacs-like bindings (useful on insert mode)
bindkey '^b' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word

# Edit current command with VIM (or whatever $EDITOR is set to)
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

# Altern between foreground/background with Ctrl-z (see custom-functions.zsh)
bindkey '^z' fancy-ctrl-z

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# easier cd into frequent directories
setopt auto_cd
cdpath=($HOME/src)

# dont share history between different shells
setopt no_share_history

# Paths common to all platforms
export PATH="$HOME/bin:$HOME/src/dotfiles/bin:$HOME/.rbenv/bin:$PATH"

# Fix bug when passing arguments to rake
unsetopt nomatch

# Ensure there is a valid temp dir for vim
if [[ ! -d "$TMPDIR"  ]]; then
  export TMPDIR="/tmp/`whoami`"
  mkdir -p -m 700 "$TMPDIR"
fi

# Enable rbenv
eval "$(rbenv init -)"

# Source local config if present
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Source fzf fuzzy finder configuration is present
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Try to use Ag as default fzf command
 export FZF_DEFAULT_COMMAND='ag -g ""'

 # enable syntax for cheat (see: https://github.com/chrisallenlane/cheat)
 export CHEATCOLORS=true

 # initialize base16 colorscheme
 set-colorscheme
