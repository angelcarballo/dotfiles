let b:execute_with='elixir'

inoreabbrev <buffer> rk =>
inoreabbrev <buffer> pipe \|>
inoreabbrev <buffer> pry require IEx; IEx.pry
inoreabbrev <buffer> bpry require IEx; IEx.pry
inoreabbrev <buffer> pecho \|> IO.inspect(label: "\nXXX")<left><left>
inoreabbrev <buffer> echo IO.inspect(label: "\nXXX")<c-o>T(
inoreabbrev <buffer> af & &1
inoreabbrev <buffer> aff fn -> end<c-o>b
inoreabbrev <buffer> eex <%= %><left><left><left>
inoreabbrev <buffer> cmod __MODULE__
inoreabbrev <buffer> peek \|> (fn arg -> require IEx; IEx.pry(); arg end).()

setlocal foldmethod=indent
setlocal foldlevel=1
" this matches default line length used by mix format
setlocal textwidth=98

nnoremap <buffer> <leader>mf :MixFormat<cr>
nnoremap <buffer> <leader>mF :call VimuxRunCommand("clear; mix format `gitfiles`")<cr>
nnoremap <buffer> <leader>mc :call VimuxRunCommand("clear; mix credo suggest --strict --format oneline --files-included " . bufname("%"))<cr>
nnoremap <buffer> <leader>mC :call VimuxRunCommand("clear; mix credo suggest --strict --format oneline `gitfiles \| xargs -I{} echo \"--files-included {}\" \| xargs`")<cr>

nnoremap <buffer> gM :silent lgrep "defmodule <cWORD> do"<cr>:lclose<cr>

let g:dispatch_compilers = {
          \ "mix test": "exunit",
          \ "mix compile": "mix",
          \ "mix credo": "credo"
          \ }
