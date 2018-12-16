"""""""" Switch between pane and window mode """"""""""
function! ToggleVimuxTarget()
	if g:VimuxRunnerType == "window"
		let g:VimuxRunnerType="pane"
		echo "Vimux mode: PANE"
	else
		let g:VimuxRunnerType="window"
		echo "Vimux mode: WINDOW"
	endif
endfunction
let g:VimuxRunnerType="pane"

