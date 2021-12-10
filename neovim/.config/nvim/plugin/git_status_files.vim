" Load git status files on the quickfix window
function! GitStatusFiles()
  let error_file = tempname()
  silent exe '!git status --porcelain | sed "s/^...\(.*\)/\1:1/" > '.error_file
  set errorformat=%f:%l
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfunction

command! -nargs=0 GitStatusFiles call GitStatusFiles()
