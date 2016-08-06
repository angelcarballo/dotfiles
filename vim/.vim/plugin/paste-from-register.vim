" Display numbered registers, and paste contents
function! Reg()
	reg
	echo "Register: "
	let char = nr2char(getchar())
	if char != "\<Esc>"
		execute "normal! \"".char."p"
	endif
	redraw
endfunction

" Allow calling with :Reg<cr>
command! -nargs=0 Reg call Reg()
