" Send the following to the runner pane before every command:
" q     : ensure we're not in tmux scroll/copy mode
" <esc> : ensure we're in readline's normal mode
" C     : replace whole line
let g:VimuxResetSequence = "qC"

" Default to bottom pane for runner
let g:VimuxRunnerType="pane"
let g:VimuxOrientation = "v"
