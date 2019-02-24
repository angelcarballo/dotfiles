" Custom strategy to avoid echoing command
function! CustomVimuxStrategy(cmd)
  call VimuxRunCommand(a:cmd)
endfunction
let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
let g:test#strategy = 'customvimux'

