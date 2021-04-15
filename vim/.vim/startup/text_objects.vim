" next <surround object>
onoremap inb :<c-u>normal! f(vi(<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>
onoremap inB :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in] :<c-u>normal! f[vi[<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in} :<c-u>normal! f{vi{<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in" :<c-u>normal! f"vi"<cr>

" entire buffer text object
onoremap ae :<c-u>normal! ggVG<cr>

" current line with/without <br>
onoremap al :<c-u>normal! V<cr>
onoremap il :<c-u>normal! 0v$h<cr>

" last pasted text
onoremap lp :<c-u>normal! `[v`]<cr>
