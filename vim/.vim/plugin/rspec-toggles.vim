"""""""" Elable/Disable spring for rspec tests """"""""""
function! ToggleSpring()
	if g:vroom_use_spring
		let g:vroom_use_spring=0
		echo 'Spring OFF'
	else
		let g:vroom_use_spring=1
		echo 'Spring ON'
	endif
endfunction
let g:vroom_use_spring=0

"""""""" Elable/Disable fail-fast option for rspec tests """"""""""
function! ToggleFailFast()
	if g:vroom_use_fail_fast
		let g:vroom_use_fail_fast=0
		let g:vroom_options={'options':'--fail-fast'}
		echo '--fail_fast OFF'
	else
		let g:vroom_use_fail_fast=1
		let g:vroom_options={'options':'--fail-fast'}
		echo '--fail_fast ON'
	endif
endfunction
let g:vroom_use_fail_fast=1
