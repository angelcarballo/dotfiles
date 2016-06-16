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

# Complete words from tmux pane(s) {{{
# Source: http://blog.plenz.com/2012-01/zsh-complete-words-from-tmux-pane.html
_tmux_pane_words() {
    local expl
    local -a w
    if [[ -z "$TMUX_PANE" ]]; then
        _message "not running inside tmux!"
        return 1
    fi
    # capture current pane first
    w=( ${(u)=$(tmux capture-pane -J -p)} )
    for i in $(tmux list-panes -F '#P'); do
        # skip current pane (handled above)
        [[ "$TMUX_PANE" = "$i" ]] && continue
        w+=( ${(u)=$(tmux capture-pane -J -p -t $i)} )
    done
    _wanted values expl 'words from current tmux pane' compadd -a w
}

zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line current
# display the (interactive) menu on first execution of the hotkey
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' menu yes select interactive
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'
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
