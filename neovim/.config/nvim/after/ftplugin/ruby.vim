" fold by indentation levels, don't ignore lines with # and disable by default
setlocal foldmethod=indent
setlocal foldignore=
setlocal nofoldenable
setlocal textwidth=120

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> bpry require 'pry'; binding.pry

nnoremap <buffer> K :DD<cr>
