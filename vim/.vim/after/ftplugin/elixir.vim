let b:execute_with='elixir'

inoreabbrev <buffer> pipe \|>
inoreabbrev <buffer> pry require IEx; IEx.pry
inoreabbrev <buffer> inline &(&1)<left>
inoreabbrev <buffer> func fn x -> end

setlocal formatprg=mix\ format\ - 
