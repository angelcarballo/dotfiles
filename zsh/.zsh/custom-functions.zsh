# Altern between foreground/background with Ctrl-z {{{
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
# }}}

# Checkout branch using fzf {{{
co() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
# }}}

# Open project tmux session {{{
ss() {
  local project
  project=$(cd $HOME/src && ls -d */ | cut -f1 -d'/' | fzf-tmux) &&
    ts $(echo "$project")
}
# }}}

# Colorscheme functions (Base16) {{{
function color {
  local base16_dir="$HOME/.config/base16-shell/scripts"

  # default colorscheme
  local colorscheme="material-dark"

  if [[ $# -eq 1 ]]; then
    colorscheme=$1
  elif [[ $# -eq 2 ]]; then
    colorscheme="$1-$2"
  else
    colorscheme=$(find $base16_dir -type f -name "base16-*.sh" -exec basename {} \; | cut -f1 -d "."  | cut -f2 -f3 -d "-" | fzf-tmux)
  fi

  set-colorscheme $colorscheme
}

function set-colorscheme {
  local base16_dir="$HOME/.config/base16-shell/scripts"
  local shell_colorscheme="$HOME/.colorscheme"
  local vim_colorscheme="$HOME/.vim_colorscheme"

  if [[ $# -eq 1 ]]; then
    colorscheme="base16-$1"
    colorscheme_script="$base16_dir/$colorscheme.sh"
    if [[ -s "$colorscheme_script" ]]; then
      echo $colorscheme_script > $shell_colorscheme
      echo "colorscheme $colorscheme" > $vim_colorscheme
      source $shell_colorscheme
    else
      echo "Unknown colorscheme: $1"
      return 1
    fi
  else
    # No argument, load current shell colorscheme
    source $shell_colorscheme
  fi
}
# }}}
