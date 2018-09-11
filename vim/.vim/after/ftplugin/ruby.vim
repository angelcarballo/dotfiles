setlocal shiftwidth=2
setlocal tabstop=2
let b:dispatch='ruby %'

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> bpry require 'pry'; binding.pry
