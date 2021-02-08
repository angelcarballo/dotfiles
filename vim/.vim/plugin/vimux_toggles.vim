"""""""" Switch between pane bottom, pane right, and window mode """"""""""
function! ToggleVimuxTarget()
  if g:VimuxRunnerType == "window"
    let g:VimuxRunnerType = "pane"
    let g:VimuxOrientation = "h"
    echo "Vimux mode: right pane"
  elseif g:VimuxOrientation == "h"
    let g:VimuxOrientation = "v"
    echo "Vimux mode: bottom pane"
  else
    let g:VimuxRunnerType = "window"
    echo "Vimux mode: window"
  endif
endfunction
