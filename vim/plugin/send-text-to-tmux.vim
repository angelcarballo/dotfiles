"""""""" Send text to tmux """"""""""
function! VimuxSlime() range
	let cmds = join(getline("'<","'>"), '')
	call VimuxRunCommand(cmds)
endfunction
