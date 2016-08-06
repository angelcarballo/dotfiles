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
