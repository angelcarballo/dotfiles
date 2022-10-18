inoreabbrev <buffer> rk =>
inoreabbrev <buffer> pipe \|>

" Remove deps from path to speed up find & friends on large projects
setlocal path-=deps/**/lib/**,deps/**/src/**

setlocal foldmethod=indent
setlocal foldlevel=1

" Match the default line length used by mix format
setlocal textwidth=98

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

" Enable/disable running mix tests on an IEx shell
function! ToggleExUnit()
  if g:test#elixir#exunit#executable == 'iex -S mix test'
    let g:test#elixir#exunit#executable = 'mix test'
    echo "Run ExUnit with: mix test"
  else
    let g:test#elixir#exunit#executable = 'iex -S mix test'
    echo "Run ExUnit with: iex -S mix test"
  endif
endfunction

let g:test#custom_transformations = {'elixir_umbrella': function('ElixirUmbrellaTransform')}
let g:test#transformation = 'elixir_umbrella'
let g:test#elixir#exunit#executable = 'mix test'
