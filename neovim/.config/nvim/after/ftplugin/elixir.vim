inoreabbrev <buffer> rk =>
inoreabbrev <buffer> pipe \|>
inoreabbrev <buffer> af & &1
inoreabbrev <buffer> aff fn -> end<c-o>b
inoreabbrev <buffer> eex <%= %><left><left><left>
inoreabbrev <buffer> cmod __MODULE__
inoreabbrev <buffer> shout IO.puts("=======> ")<left><left>
inoreabbrev <buffer> importham import Hammox, only: [expect: 3, verify_on_exit!: 1]\rsetup :verify_on_exit!
inoreabbrev <buffer> importdecimal import Duffel.Core.Sigils, only: [sigil_d: 2]
inoreabbrev <buffer> importecto import Ecto.Query, only: [from: 2]
inoreabbrev <buffer> usedatacase use Duffel.Core.DataCase, async: true
inoreabbrev <buffer> rawquery Ecto.Adapters.SQL.to_sql(:all, Repo, )<left>
inoreabbrev <buffer> pdbg \|> dbg()

" Spell check strings and comments
setlocal spell

" Remove deps from path to speed up find & friends on large projects
setlocal path-=deps/**/lib/**,deps/**/src/**
" Some projects have unit_test env
setlocal path+=unit_test/**

setlocal foldmethod=indent
setlocal foldlevel=1

" When running tests from an umbrella app, run them locally instead of using
" the top level. This avoid loading the whole app which usually speeds up
" things.
function! ElixirUmbrellaTransform(cmd) abort
  " Unit test env uses a different jet task
  if match(a:cmd, 'unit_test/') != -1
    let l:cmd = substitute(a:cmd, 'mix test', 'mix unit_test', '')
    let l:app_path = matchlist(l:cmd, '\(apps/[^/]*\)/')[0]

    " remove apps/some_app from the file path as unit_test requires it
    let l:unit_test_cmd = substitute(l:cmd, '\(apps/[^/]*\)/', '', '')

    return l:unit_test_cmd
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
