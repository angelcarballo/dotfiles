" Operator to perform a web search for a given motion or visual/block selection
function! WebSearch(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  let l:browser_cmd = "open"
  let l:search_engine_url = "https://duckduckgo.com/?q="
  let l:search_param = substitute(join(split(@@), "+"), '"', "", "g")
  let l:url = l:search_engine_url . l:search_param

  execute "silent !" l:browser_cmd . " \"" . l:url . "\" "
  execute "redraw!"

  let &selection = sel_save
  let @@ = reg_save
endfunction
