" Override errorformat provided by vim-elixir:
" https://github.com/elixir-editors/vim-elixir/blob/master/compiler/mix.vim

if exists('current_compiler')
    finish
endif
let current_compiler = 'mix'

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mix\ compile

" > Compiling 1 file (.ex)
" >
CompilerSet errorformat=
      \%-GCompiling\ %.%#,
      \%-G,

" > warning: some warning message
" >   lib/example.ex:23: Example.foo/0
CompilerSet errorformat+=
      \%Wwarning:\ %m,
      \%Z\ \ %f:%l:\ %.%#

" > warning: some warning message
" >   lib/example.ex:23
CompilerSet errorformat+=
      \%Wwarning:\ %m,
      \%Z\ \ %f:%l

" > == Compilation error in file lib/example/example.ex ==
" > ** (CompileError) lib/example/example.ex:11: undefined function foo/0
" >     (elixir 1.11.4) src/elixir_locals.erl:114: anonymous fn/3 in :elixir_locals.ensure_no_undefined_local/3
" >     (stdlib 3.14.1) erl_eval.erl:680: :erl_eval.do_apply/6
CompilerSet errorformat+=
      \%-GCompiling\ %.%#,
      \%-GGenerated\ %.%#,
      \%-G,
      \%E==%.%#,
      \%C**\ (%\\w%\\+)\ %f:%l:%c:\ %m,
      \%C**\ (%\\w%\\+)\ %f:%l:\ %m,
      \%-C\ \ %.%#,
      \%Z
