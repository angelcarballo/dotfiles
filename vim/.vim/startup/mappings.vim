" Mappings (leader) ---------------------------------------------------------{{{

" map leader to <space>
let mapleader="\<space>"

" Show and switch to buffers
nmap <leader><space> :buffers<cr>:bu<space>

" Search files with FZF
nmap <leader>, :GFiles<cr>

" Quick toggle between last two buffers
nmap <tab> <c-^>

" /,? - Search in project
nnoremap <leader>/ :silent grep ""<left>
nnoremap <leader>? :silent grep "" "**" ":!spec/"<c-left><c-left><left><left>

" * - Search in project for word under cursor
nnoremap <leader>* :silent grep "<c-r><c-w>"<cr>
nnoremap <leader>8 :silent grep "<c-r><c-w>"<cr>
xnoremap <leader>* "hy:silent grep "<c-r>h"<cr>
xnoremap <leader>8 "hy:silent grep "<c-r>h"<cr>

" b - Buffers
nnoremap <silent> <leader>bd :bprevious <bar> bdelete #<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>bo :w <bar> %bd <bar> e#<cr>

" c - Copy/clear
if has("mac") || has("gui_macvim") || has("gui_mac")
  " copy git branch
  nnoremap <leader>cb :let @*=fugitive#head()<cr>:echo "Git branch copied"<cr>

  " copy file name  (foo.txt)
  nnoremap <leader>cfn :let @*=expand("%:t")<cr>:echo "Full name copied"<cr>

  " copy relative path  (src/foo.txt)
  nnoremap <leader>cfp :let @*=expand("%")<cr>:echo "File path copied"<cr>

  " copy absolute path  (/something/src/foo.txt)
  nnoremap <leader>cfP :let @*=expand("%:p")<cr>:echo "Full file path copied"<cr>

  " copy relative path with line number
  nnoremap <leader>cfl :let @*=join([expand('%'),  line(".")], ':')<cr>:echo "File path including line number copied"<cr>

  " copy file folder path (src/)
  nnoremap <leader>cff :let @*=expand("%:p:h")<cr>:echo "File folder path copied"<cr>
endif
nnoremap <leader>cs :nohl<cr>

" d - Duplicate
nnoremap <leader>dp yap}p
nnoremap <leader>dl yy:Commentary<cr>p
xnoremap <leader>dl ygv:Commentary<cr>']p

" e - Explore
nnoremap <silent> <leader>er :edit .<cr>
nnoremap <silent> <leader>ei :Explore<cr>
nnoremap <silent> <leader>es :Sex<cr>
nnoremap <silent> <leader>ev :Vex<cr>

" f - File/Find
nnoremap <leader>fs :up<cr>
nnoremap <silent> <leader>fa :Files<cr>
nnoremap <silent> <leader>fD :Files %:p:h<cr>
nnoremap <silent> <leader>ff :GFiles<cr>
nnoremap <silent> <leader>fg :GFiles?<cr>
nnoremap <silent> <leader>fr :History<cr>
nnoremap <silent> <leader>fR :e %<cr>
nnoremap <silent> <leader>ft :Ag<cr>
nnoremap <silent> <leader>fh :Helptags<cr>
nnoremap <silent> <leader>fn :enew<cr>
nnoremap <silent> <leader>fm :Marks<cr>

" g - Git/Generate
nnoremap <leader>gs :Gstatus \| wincmd T<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gc :Gcommit<cr>i
nnoremap <leader>gf :GitStatusFiles<cr><c-w>k
nnoremap <leader>gd :Gdiff HEAD<cr>
nnoremap <leader>gD :Gdiff origin/master<cr>
nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gp :Gpull<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gh :Gbrowse<cr>
xnoremap <leader>gh :Gbrowse<cr>
nnoremap <leader>gl :Glog<cr>
xnoremap <leader>gl :Glog<cr>

nnoremap <leader>gt :VimuxRunCommand("ctags -R")<cr>

" i - Indent / Insert
nnoremap <leader>ij :%!python -m json.tool<cr>

" o - open
nnoremap <leader>of :! open '%'<cr>
nnoremap <leader>on :FZF $NOTES/<cr>

" pry
nnoremap <leader>pry Orequire 'pry'; binding.pry

" P - Plugins
nnoremap <leader>Pi :call minpac#update()<cr>
nnoremap <leader>Pc :call minpac#clean()<cr>

" q - Quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qall!<cr>

" r - Remove
nnoremap <silent> <leader>rw :%s/\s\+$//<cr>:w<cr>

" s - Specs
nnoremap <leader>sa :TestSuite<cr>
nnoremap <leader>sf :TestFile<cr>
nnoremap <leader>sc :TestNearest<cr>
nnoremap <leader>sl :TestLast<cr>
nnoremap <leader>sg :TestVisit<cr>
nnoremap <leader>so :cgetfile quickfix.out \| cwindow<cr>

" S - Show
nnoremap <silent> <leader>Sf :echo @%<cr>
nnoremap <silent> <leader>Sp :echo expand('%:p')<cr>
nnoremap <silent> <leader>Sb :echo "Current git branch: " . fugitive#head()<cr>

" t - Tmux/Tabs
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :VimuxCloseRunner<cr>
nnoremap <silent> <leader>tf :VimuxZoomRunner<cr>
nnoremap <silent> <leader>ti :VimuxInspectRunner<cr>
nnoremap <silent> <leader>to :VimuxRunCommand("")<cr>

" V - Vimrc
nnoremap <leader>Ve :e $MYVIMRC<cr>
nnoremap <leader>Vs :so $MYVIMRC<cr>

" w - Windows/Tabs
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>we <c-w>=
nnoremap <silent> <leader>ws :sp<cr>
nnoremap <silent> <leader>wt :tabedit %<cr>
nnoremap <silent> <leader>wv :vsp<cr>
nnoremap <silent> <leader>ww <c-w>w

" x - eXecute
nnoremap <leader>x :call VimuxRunCommand(bufname("%"))<left>

" ---------------------------------------------------------------------------}}}
" Mappings (other) ----------------------------------------------------------{{{

" pane navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Easy history traversal on command line
cnoremap <c-n> <up>
cnoremap <c-p> <down>

" Use tab for both indentation and autocomplete
inoremap <tab> <c-r>=Tab_Or_Complete()<cr>

" Easily exit insert mode
inoremap kj <esc>

" allows incsearch highlighting for range commands
" i.e. search with /,? and then copy/move/delete
cnoremap &y <cr>:copy''<cr>
cnoremap &c <cr>:copy''<cr>
cnoremap &m <cr>:move''<cr>
cnoremap &d <cr>:delete<cr>``

" Fix closest spelling error
inoremap <c-f> <c-g>u<esc>[s1z=`]a<c-g>u

" Auto indent pasted text
nnoremap p p=`]<c-o>
nnoremap P P=`]<c-o>
" keep originals too
nnoremap gp p
nnoremap gP P

" Search and replace current visual selection
xnoremap <c-r> "hy:%s/<c-r>h//g<left><left>

" Move around using visual lines, useful when wrap is enabled
" if a count is provided, default j/k behavior is used
" and jumps bigger thank 5 lines are added to the jump list
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Use cursors to resize windows
noremap <silent> <left> :vertical resize -3<cr>
noremap <silent> <right> :vertical resize +3<cr>
noremap <silent> <down> :resize +3<cr>
noremap <silent> <up> :resize -3<cr>

" Use cursors to move lines in visual mode
xnoremap <up> :move '<-2<cr>gv=gv
xnoremap <down> :move '>+<cr>gv=gv

" Easily run the last command on selected lines
xnoremap . :norm.<cr>

" Make Y behave like other capitals (yank from cursor to end of line)
nnoremap Y y$

" Easy beginning/end of line
nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $

" Exit neovim terminal mode like insert mode
if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

" ---------------------------------------------------------------------------}}}
" Unimpaired style ----------------------------------------------------------{{{

" previous/next file in current folder
nnoremap ]f :<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(v:count1), ':.'))<cr><cr>
nnoremap [f :<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(-v:count1), ':.'))<cr><cr>

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

nnoremap [q :cprevious<cr>
nnoremap ]q :cnext<cr>

nnoremap [w :tabprevious<cr>
nnoremap ]w :tabnext<cr>

" Add new line above/bellow current one
nnoremap [<space> :call append(line(".") -1, "")<cr>
nnoremap ]<space> :call append(line("."), "")<cr>

nnoremap cob :setlocal scrollbind! scrollbind?<cr>
nnoremap coc :setlocal cursorline! cursorline?<cr>
nnoremap cof :setlocal foldenable! foldenable?<cr>
nnoremap cop :setlocal paste! paste?<cr>
nnoremap cos :setlocal spell! spell?<cr>
nnoremap cow :setlocal wrap! wrap?<cr>

nnoremap cot :call ToggleVimuxTarget()<cr>
nnoremap coq :call ToggleQuickFix()<cr>


" ---------------------------------------------------------------------------}}}
" Operators -----------------------------------------------------------------{{{

" Align
nnoremap ga =

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
