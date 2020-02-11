setlocal shiftwidth=2
setlocal tabstop=2
" fold by indentation levels, don't ignore lines with # and disable by default
setlocal foldmethod=indent
setlocal foldignore=
setlocal nofoldenable

let b:execute_with='ruby'

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> bpry require 'pry'; binding.pry

let b:AutoPairs = AutoPairsDefine({'|' : '|'})
