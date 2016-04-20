" trailing space detection for statusline
function! StatuslineTrailingSpaceWarning()
	if !exists("b:statusline_trailing_space_warning")
		if search('\s\+$', 'nw') != 0
			let b:statusline_trailing_space_warning = ' Trailing space '
		else
			let b:statusline_trailing_space_warning = ''
		endif
	endif
	return b:statusline_trailing_space_warning
endfunction
