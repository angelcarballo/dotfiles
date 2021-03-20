let b:execute_with='elixir'

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> pipe \|>
inoreabbrev <buffer> pry require IEx; IEx.pry
inoreabbrev <buffer> echo IO.inspect(, label: "VALUE:")<c-o>F,
inoreabbrev <buffer> af &(&1)<left>
inoreabbrev <buffer> aff fn x -> end<left><left><left><left>
inoreabbrev <buffer> ht [h \| t]
inoreabbrev <buffer> eex <%= %><left><left><left>
inoreabbrev <buffer> cmod %__MODULE__

setlocal formatprg=mix\ format\ - 
setlocal makeprg=mix\ compile
setlocal foldmethod=indent
setlocal foldlevel=1

nnoremap <buffer> K :DD<cr>
