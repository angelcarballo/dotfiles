" Override errorformat provided by vim-elixir:
" https://github.com/elixir-editors/vim-elixir/blob/master/compiler/credo.vim

if exists('current_compiler')
    finish
endif
let current_compiler = 'credo'

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mix\ credo\ suggest\ --format=flycheck\ --strict

"> warning: redefining module Duffel.Core.CustomCredoChecks.TimexTimezoneConverter (current version loaded from _build/dev/lib/duffel_core/ebin/Elixir.Duffel.Core.CustomCredoChecks.TimexTimezoneConverter.beam)
"   apps/duffel_core/lib/core/custom_credo_checks/timex_timezone_converter.ex:1
CompilerSet errorformat=
      \%-Gwarning:\ %.%#,
      \%-G\ \ %f:%l,
      \%-G,

" > apps/duffel_air/lib/air/orders.ex:27:9: R: The alias `Duffel.Air.Orders.OrderSegmentPassenger` is not alphabetically ordered among its group.
CompilerSet errorformat+=%f:%l:%c:\ %m
CompilerSet errorformat+=%f:%l:\ %m
