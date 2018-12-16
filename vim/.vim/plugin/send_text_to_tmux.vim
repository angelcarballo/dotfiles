"""""""" Send text to tmux """"""""""
function! SendTextToTmux() range
	let cmds = join(getline("'<","'>"), '')
	call VimuxRunCommand(cmds)
endfunction
