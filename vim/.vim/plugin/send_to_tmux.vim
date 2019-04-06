" Operator to send given motion/visual block to tmux
" (requires Vimux plugin)
function! SendTextToTmux(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  let l:extra_newline = 0

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>y"
    let l:extra_newline = 1
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
    let l:extra_newline = 1
  endif

  call VimuxSendText(@@)
  if l:extra_newline
    call VimuxSendKeys("Enter")
  endif

  let &selection = sel_save
  let @@ = reg_save
endfunction
