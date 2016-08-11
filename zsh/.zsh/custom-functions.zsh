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

  if [[ $# -eq 1 ]]; then
    color_path="$base16_dir/base16-$1.sh"
    set-colorscheme $color_path
  elif [[ $# -eq 2 ]]; then
    colorscheme="$base16_dir/base16-$1-$2.sh"
    set-colorscheme $color_path
  else
    colorscheme=$(find $base16_dir -type f -name "base16-*.sh" -exec basename {} \; | cut -f1 -d "."  | cut -f2 -f3 -d "-" | fzf-tmux)
    color_path="$base16_dir/base16-$colorscheme.sh"
    set-colorscheme $color_path
  fi
}

function set-colorscheme {
  local current_colorscheme="$HOME/.colorscheme"

  if [[ -s "$1" ]]; then
    echo $1 > $current_colorscheme
    source $1
  elif [ -f $current_colorscheme ]; then
    source $current_colorscheme
  fi
}
# }}}
