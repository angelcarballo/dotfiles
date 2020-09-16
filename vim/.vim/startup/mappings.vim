" Mappings (leader) ---------------------------------------------------------{{{

let mapleader="\<space>"

" easily exit insert mode
inoremap kj <esc>

" don't go into Ex mode
nnoremap Q <nop>

" Show and switch to buffers
nnoremap <leader><space> :buffers<cr>:bu<space>

" Show and navigate to mark
nnoremap <leader>, :marks<cr>:mark <space>

" Quick toggle between last two buffers
nnoremap <tab> <c-^>

" /,? - Search in project
nnoremap <leader>/ :silent grep ""<left>
nnoremap <leader>? :silent grep -g !spec ""<left>

" * - Search in file or project
xnoremap * "zy/<c-r>z<cr>
nnoremap <leader>8 :silent grep "<cword>"<cr>
xnoremap <leader>8 "zy:silent grep "<c-r>z"<cr>

" args
nnoremap <leader>aa :argadd<cr>

" b - Buffers
nnoremap <silent> <leader>bo :w <bar> %bd <bar> e#<cr>

" c - Copy/clear
if has("mac") || has("gui_macvim") || has("gui_mac")
  " copy git branch
  nnoremap <leader>cb :let @*=fugitive#head()<cr>:echo "<c-r>*"<cr>

  " copy file name  (foo.txt)
  nnoremap <leader>cfn :let @*=expand("%:t")<cr>:echo "<c-r>*"<cr>

  " copy relative path  (src/foo.txt)
  nnoremap <leader>cfp :let @*=expand("%")<cr>:echo "<c-r>*"<cr>

  " copy absolute path  (/something/src/foo.txt)
  nnoremap <leader>cfP :let @*=expand("%:p")<cr>:echo "<c-r>*"<cr>

  " copy relative path with line number
  nnoremap <leader>cfl :let @*=join([expand('%'),  line(".")], ':')<cr>:echo "<c-r>*"<cr>

  " copy file folder path (src/)
  nnoremap <leader>cff :let @*=expand("%:p:h")<cr>:echo "<c-r>*"<cr>
endif
nnoremap <leader>co :Git checkout<space>
nnoremap <leader>cs :nohl<cr>
nnoremap <leader>cf :Cfilter<space>
nnoremap <leader>c! :Cfilter!<space>

" d - Duplicate
nnoremap <leader>dp yap}p
nnoremap <leader>dl yy:Commentary<cr>p
xnoremap <leader>dl ygv:Commentary<cr>']p

" e - Explore/Extract
xnoremap <silent> <leader>em :call ExtractMethod()<cr>
nnoremap <silent> <leader>ei :Explore<cr>
nnoremap <silent> <leader>es :Sex<cr>
nnoremap <silent> <leader>ev :Vex<cr>

" f - File/Find
nnoremap <leader>fs :up<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fd :Files %:p:h<cr>
nnoremap <silent> <leader>fF :Files<cr>
nnoremap <silent> <leader>fg :GFiles?<cr>
nnoremap <silent> <leader>fr :History<cr>
nnoremap <silent> <leader>fh :Helptags<cr>
nnoremap <silent> <leader>fm :Marks<cr>

" g - Git/Generate
nnoremap <leader>gD :Gdiff origin/master<cr>
nnoremap <leader>gP :VimuxRunCommand("git push")<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff HEAD<cr>
nnoremap <leader>gf :GitStatusFiles<cr><c-w>k
nnoremap <leader>gh :Gbrowse<cr>
xnoremap <leader>gh :Gbrowse<cr>
nnoremap <leader>gl :0Gclog<cr>
nnoremap <leader>gL :Gclog<cr>
xnoremap <leader>gl :Gclog<cr>
nnoremap <leader>gp :Gpull<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus\|wincmd T<cr>
nnoremap <leader>gw :Gwrite<cr>

" i - Indent / Insert
nnoremap <leader>ij :%!python -m json.tool<cr>

" o - open
nnoremap <leader>of :! open '%'<cr>
nnoremap <leader>on :FZF $NOTES/<cr>

" P - Plugins
nnoremap <leader>Pi :call minpac#update()<cr>
nnoremap <leader>Pc :call minpac#clean()<cr>

" q - Quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qall!<cr>

" r - Remove
nnoremap <silent> <leader>rw :%s/\s\+$//<cr>:w<cr>

" s - Specs/Split
nnoremap <leader>sa :TestSuite<cr>
nnoremap <leader>sf :TestFile<cr>
nnoremap <leader>sc :TestNearest<cr>
nnoremap <leader>sl :TestLast<cr>
nnoremap <leader>sg :TestVisit<cr>

" S - Show
nnoremap <silent> <leader>Sf :echo @%<cr>
nnoremap <silent> <leader>Sp :echo expand('%:p')<cr>
nnoremap <silent> <leader>Sb :echo "Git branch: " . fugitive#head()<cr>

" T - Tabs
nnoremap <silent> <leader>tn :tabnew<cr>

" v - Vimux
nnoremap <silent> <leader>vc :VimuxCloseRunner<cr>
nnoremap <silent> <leader>vo :VimuxRunCommand("")<cr>

" V - Vimrc
nnoremap <leader>Ve :e $MYVIMRC<cr>
nnoremap <leader>Vs :so $MYVIMRC<cr>

" w - Windows/Tabs
nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>we <c-w>=
nnoremap <silent> <leader>ws :sp<cr>
nnoremap <silent> <leader>wt :tabedit %<cr>
nnoremap <silent> <leader>wv :vsp<cr>


" ---------------------------------------------------------------------------}}}
" Mappings (other) ----------------------------------------------------------{{{

" auto close pairs
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap '' ''
inoremap "" ""
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap (<cr> (<cr>)<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap {<cr> {<cr>}<c-o>O<tab>

" pane navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Use tab for both indentation and autocomplete
inoremap <tab> <c-r>=Tab_Or_Complete()<cr>


" Fix closest spelling error
inoremap <c-f> <c-g>u<esc>[s1z=`]a<c-g>u

" Auto indent pasted text
nnoremap p p=`]<c-o>
nnoremap P P=`]<c-o>
" keep originals too
nnoremap gp p
nnoremap gP P

" Search and replace current visual selection
xnoremap <c-r> "zy:%s/<c-r>z//g<left><left>

" Move around using visual lines, useful when wrap is enabled
" if a count is provided, default j/k behavior is used
" and jumps bigger thank 5 lines are added to the jump list
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Use cursors to resize windows
noremap <left> :vertical resize -3<cr>
noremap <right> :vertical resize +3<cr>
noremap <down> :resize +3<cr>
noremap <up> :resize -3<cr>

" Use cursors to move lines in visual mode
xnoremap <up> :move '<-2<cr>gv=gv
xnoremap <down> :move '>+<cr>gv=gv

" and to increase/decrease indentation
xnoremap <right> >gv
xnoremap <left> <gv

" Easy beginning/end of line
nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $

" Exit terminal mode like insert mode
if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

" ---------------------------------------------------------------------------}}}
" Unimpaired style ----------------------------------------------------------{{{

" previous/next file in current folder
nnoremap ]f :<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(v:count1), ':.'))<cr><cr>
nnoremap [f :<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(-v:count1), ':.'))<cr><cr>

nnoremap ]a :next<cr>
nnoremap [a :previous<cr>

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

nnoremap [q :cprevious<cr>
nnoremap ]q :cnext<cr>

nnoremap [Q :colder<cr>
nnoremap ]Q :cnewer<cr>

nnoremap [l :lprevious<cr>
nnoremap ]l :lnext<cr>

nnoremap [w :tabprevious<cr>
nnoremap ]w :tabnext<cr>

" Add new line above/bellow current one
nnoremap [<space> :call append(line(".") -1, "")<cr>
nnoremap ]<space> :call append(line("."), "")<cr>

nnoremap coc :setlocal cursorline! cursorline?<cr>
nnoremap coC :setlocal cursorcolumn! cursorcolumn?<cr>
nnoremap cof :setlocal foldenable! foldenable?<cr>
nnoremap coh :setlocal hlsearch! hlsearch?<cr>
nnoremap cop :setlocal paste! paste?<cr>
nnoremap cos :setlocal spell! spell?<cr>
nnoremap cow :setlocal wrap! wrap?<cr>

nnoremap cot :call ToggleVimuxTarget()<cr>
nnoremap coq :call ToggleQuickFix()<cr>
nnoremap col :call ToggleLocation()<cr>


" ---------------------------------------------------------------------------}}}
" Operators -----------------------------------------------------------------{{{

" web search operator
nnoremap <silent> gs :set opfunc=WebSearch<cr>g@
xnoremap <silent> gs :<c-u>call WebSearch(visualmode(), 1)<cr>

" copy to system clipboard
nnoremap <silent> cP V"*y
nnoremap <silent> cp "*y
xnoremap <silent> cp "*y

" send text to tmux operator
nnoremap <silent> gt :set opfunc=SendTextToTmux<cr>g@
xnoremap <silent> gt :<c-u>call SendTextToTmux(visualmode(), 1)<cr>

" ---------------------------------------------------------------------------}}}
