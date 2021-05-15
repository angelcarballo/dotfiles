let b:execute_with='elixir'

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> pipe \|>
inoreabbrev <buffer> pry require IEx; IEx.pry
inoreabbrev <buffer> bpry require IEx; IEx.pry
inoreabbrev <buffer> echo IO.inspect(label: "")<left><left>
inoreabbrev <buffer> af &(&1)<left>
inoreabbrev <buffer> aff fn -> end<c-o>b
inoreabbrev <buffer> ht [h \| t]
inoreabbrev <buffer> eex <%= %><left><left><left>
inoreabbrev <buffer> cmod __MODULE__

setlocal foldmethod=indent
setlocal foldlevel=1
setlocal keywordprg=:Dash!

nnoremap <buffer> <leader>mf :%!mix format -<cr>
nnoremap <buffer> gM :silent lgrep "defmodule <cWORD> do"<cr>:lclose<cr>
