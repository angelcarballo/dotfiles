let b:execute_with='elixir'

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> pipe \|>
inoreabbrev <buffer> pry require IEx; IEx.pry
inoreabbrev <buffer> af &(&1)<left>
inoreabbrev <buffer> aff fn x -> end<left><left><left><left>

setlocal formatprg=mix\ format\ - 
setlocal makeprg=mix\ compile
