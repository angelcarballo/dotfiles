setlocal keywordprg=:DD
setlocal shiftwidth=2
setlocal tabstop=2
let b:execute_with='ruby'

" uncomment to enable folding, without closing folds by default
" this will affect performance on big ruby files, so use with care
" let ruby_fold = 1
" set foldlevel=99

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> bpry require 'pry'; binding.pry
