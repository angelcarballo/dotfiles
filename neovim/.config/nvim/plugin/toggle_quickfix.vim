function! ToggleQuickFix()
    for i in range(1, winnr('$'))
        let bufnum = winbufnr(i)
        if getbufvar(bufnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
