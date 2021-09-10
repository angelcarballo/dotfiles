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
inoreabbrev <buffer> peek \|> tap(fn current -> require IEx; IEx.pry(); end)
inoreabbrev <buffer> shout IO.puts("=======>")

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

function! ElixirUmbrellaTransform(cmd) abort
  if match(a:cmd, 'apps/') != -1
    let l:app_path = matchlist(a:cmd, '\(apps/[^/]*\)/')[0]

    " remove apps/some_app from the file path
    let l:app_cmd = substitute(a:cmd, '\(apps/[^/]*\)/', '', '')

    " run mix test command in a subshell to avoid switching the cwd
    return "(cd " . l:app_path . "; " . l:app_cmd . ")"
  else
    return a:cmd
  end
endfunction

let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir_umbrella'
