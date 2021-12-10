""""" Enable/disable running mix tests on an IEx shell
function! ToggleExUnitIex()
  if g:test#elixir#exunit#executable == 'iex -S mix test'
    let g:test#elixir#exunit#executable = 'mix test'
    echo "Run ExUnit with: mix test"
  else
    let g:test#elixir#exunit#executable = 'iex -S mix test'
    echo "Run ExUnit with: iex -S mix test"
  endif
endfunction
