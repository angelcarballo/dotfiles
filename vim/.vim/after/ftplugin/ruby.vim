setlocal shiftwidth=2
setlocal tabstop=2
let b:dispatch='ruby %'

" enable folding, but don't close any folds by default
let ruby_fold = 1
set foldlevel=99

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> bpry require 'pry'; binding.pry
