"" General
set antialias
set visualbell      " disable audible bell
set guioptions-=Tm  " hide toolbar, menu bar

if g:os == 'Linux'
  set guifont=Iosevka\ Term\ Medium\ 14
elseif g:os == 'Darwin'
  set guifont=Iosevka-Term-Medium:h16
endif
