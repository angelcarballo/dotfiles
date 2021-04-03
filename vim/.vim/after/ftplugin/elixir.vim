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
nnoremap <buffer> <leader>mf :%!mix format -<cr>

" Match error messages
"
" > == Compilation error in file lib/example/example.ex ==
" > ** (CompileError) lib/example/example.ex:11: undefined function foo/0
" >     (elixir 1.11.4) src/elixir_locals.erl:114: anonymous fn/3 in :elixir_locals.ensure_no_undefined_local/3
" >     (stdlib 3.14.1) erl_eval.erl:680: :erl_eval.do_apply/6
set errorformat=
      \%E==%.%#,
      \%C**\ (%\\w%\\+)\ %f:%l:%c:\ %m,
      \%C**\ (%\\w%\\+)\ %f:%l:\ %m,
      \%Z

" Match warning messages:
"
" > warning: variable "foo" does not exist and is being expanded to "foo()", please use parentheses to remove the ambiguity or change the variable name
" >   lib/example/example.ex:11: example.example.my_function/1
"
" > warning: undefined function bar/0
" >   lib/example/example.ex:16
set errorformat+=
      \%Wwarning:\ %m,
      \%Z\ \ %f:%l:\ %m
set errorformat+=
      \%Wwarning:\ %m,
      \%Z\ \ %f:%l

" Ignore everything else: 'Compiling X files' header, blank lines, etc.
"
" > Compiling 1 file (.ex)
set errorformat+=
      \%-GCompiling%.%#,
      \%-G%.%#
