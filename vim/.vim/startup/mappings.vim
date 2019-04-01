" Mappings (leader) ---------------------------------------------------------{{{

" map leader to <space>
let mapleader="\<Space>"

" Show and switch to buffers
nmap <leader><space> :buffers<cr>:bu<Space>
nmap <tab> <c-^>

" Split line with proper indentation
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<cr>

" , - Show and paste from registers
nnoremap <leader>, :Reg<cr>

" <leader> - Switch between the last two files
nnoremap <leader><tab> :tabn<cr>

" /,? - Search in project
nnoremap <leader>/ :silent Ggrep ""<left>
nnoremap <leader>? :silent Ggrep "" "**" ":!spec/"<c-left><c-left><left><left>

" * - Search visual selection
xnoremap * :<C-u>call SetVisualSearch('/')<cr>/<C-R>=@/<cr><cr>
xnoremap # :<C-u>call SetVisualSearch('?')<cr>?<C-R>=@/<cr><cr>

" * - Search in project for word under cursor
nnoremap <leader>* :silent Ggrep "<c-r><c-w>"<cr>
nnoremap <leader>8 :silent Ggrep "<c-r><c-w>"<cr>
xnoremap <leader>* "hy:silent Ggrep "<c-r>h"<cr>
xnoremap <leader>8 "hy:silent Ggrep "<c-r>h"<cr>

" a - Auto..
" auto correct spelling mistake
nnoremap <leader>ac [s1z=

" b - Buffers
nnoremap <silent> <leader>b :bprevious <bar> bdelete #<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>bo :w <bar> %bd <bar> e#<cr>

" c - Copy/Clear/Close/Quickfix
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

" clear search results (both highlight and quickfix window)
nnoremap <silent> <leader>cs :nohl<cr>

" clear git status window
nnoremap <silent> <leader>cg <c-w>k<c-w>c

" d - Duplicate
nnoremap <leader>dp yap}p
nnoremap <leader>dl yy:Commentary<cr>p
xnoremap <leader>dl ygv:Commentary<cr>']p

" e - Explore
nnoremap <silent> <leader>ei :Explore<cr>
nnoremap <silent> <leader>es :Sex<cr>
nnoremap <silent> <leader>ev :Vex<cr>

" f - File/Find
nnoremap <leader>fs :up<cr>
nnoremap <silent> <leader>fa :Files<cr>
nnoremap <silent> <leader>fD :Files %:p:h<cr>
nnoremap <silent> <leader>ff :GFiles<cr>
nnoremap <silent> <leader>fF :Ag<cr>
nnoremap <silent> <leader>fg :GFiles?<cr>
nnoremap <silent> <leader>fr :History<cr>
nnoremap <silent> <leader>fR :e %<cr>
nnoremap <silent> <leader>ft :FZF spec/<cr>
nnoremap <silent> <leader>fh :Helptags<cr>
nnoremap <silent> <leader>fn :enew<cr>

nnoremap <silent> <leader>fd :FindDefinition<cr>

" F - Fold
nnoremap <leader>Ff :setlocal foldmethod=indent foldlevelstart=999 foldminlines=0<cr>

" g - Git
nnoremap <leader>gs :vert Gstatus<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gc :Gcommit<cr>i
nnoremap <leader>gf :GitStatusFiles<cr><c-w>k
nnoremap <leader>gd :Gdiff HEAD<cr>
nnoremap <leader>gD :Gdiff master<cr>
nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gp :Gpull<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gh :Gbrowse<cr>
xnoremap <leader>gh :Gbrowse<cr>
nnoremap <leader>gl :Glog<cr>
xnoremap <leader>gl :Glog<cr>

" i - Indent / Insert
nnoremap <leader>ij :%!python -m json.tool<cr>

" m - Make
nnoremap <silent> <leader>m :Make!<cr>
nnoremap <silent> <leader>M :Make<cr>

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

" r - Remove/Run
nnoremap <silent> <leader>rw :%s/\s\+$//<cr>:w<cr>
nnoremap <silent> <leader>rr :VimuxPromptCommand<cr>

" s - Specs
nnoremap <leader>sa :TestSuite<cr>
nnoremap <leader>sf :TestFile<cr>
nnoremap <leader>sc :TestNearest<cr>
nnoremap <leader>sl :TestLast<cr>
nnoremap <leader>sg :TestVisit<cr>
nnoremap <leader>so :cgetfile quickfix.out \| cwindow<cr>
nnoremap <leader>sq :cgetfile quickfix.out \| cwindow<cr>

" S - Show/Snippets
nnoremap <silent> <leader>Sf :echo @%<cr>
nnoremap <silent> <leader>Sp :echo expand('%:p')<cr>
nnoremap <silent> <leader>Sb :echo "Current git branch: " . fugitive#head()<cr>

" t - Tmux/Tabs

" Prompt for a command to run
nnoremap <silent> <leader>tr :VimuxRunCommand("")<left><left>
" Send visual selection to tmux
xnoremap <silent> <leader>tt :call VimuxSlime()<cr>
" Send current line to tmux
noremap <silent> <leader>tl V:call VimuxSlime()<cr>
" Send whole file to tmux
noremap <silent> <leader>te ggVG:call VimuxSlime()<cr>
" Other tmux interactions
nnoremap <silent> <leader>to :VimuxRunCommand("")<cr>
nnoremap <silent> <leader>ti :VimuxInspectRunner<cr>
nnoremap <silent> <leader>tc :VimuxCloseRunner<cr>
nnoremap <silent> <leader>tf :VimuxZoomRunner<cr>

" Tab management
nnoremap <silent> <leader>tn :tabnew<cr>

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
nnoremap <leader>x :call VimuxRunCommand(b:execute_with." ".bufname("%"))<cr>

" z - Zoom
nnoremap <leader>z :VimuxZoomRunner<cr>

" ---------------------------------------------------------------------------}}}
" Mappings (other) ----------------------------------------------------------{{{

" pane navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Quick align
nnoremap ga =

" Easy history traversal on command line
cmap <c-n> <up>
cmap <c-p> <down>

" Use tab for both indentation and autocomplete
inoremap <tab> <c-r>=Tab_Or_Complete()<cr>

" Increment/decrement numbers using +/-
nnoremap + <C-a>
nnoremap - <C-x>

" Better paste from register
inoremap <c-v> :Reg<cr>

" Search documentation for word under cursor
nnoremap <silent> K :Dash<cr>

" Easily exit insert mode
inoremap kj <esc>

" select last inserted text
nnoremap gV `[v`]

" search for word under cursor in normal and visual mode
nnoremap gs :WebSearchCursor<cr>
xnoremap gs :WebSearchVisual<cr>

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

" Delete lines and word from insert mode
inoremap <c-d> <esc>ddi
inoremap <c-w> <esc>bdiwi

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

" Easily run the last command on selected lines
xnoremap . :norm.<cr>

" Make Y behave like other capitals (yank from cursor to end of line)
nnoremap Y y$

" Easy beginning/end of line
nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $

" Unimpaired style next/previews tab
nnoremap [w :tabp<cr>
nnoremap ]w :tabn<cr>

" Navigate between buffers with C-n/C-p
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprevious<cr>

" Additions to unimpaired option toggles
nnoremap cof :setlocal foldenable! foldenable?<cr>
nnoremap cop :setlocal paste! paste?<cr>
nnoremap cot :call ToggleVimuxTarget()<cr>
nnoremap cos :setlocal scrollbind! scrollbind?<cr>
nnoremap coq :call ToggleQuickFix()<cr>

" Exit neovim terminal mode like insert mode
if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif


" ---------------------------------------------------------------------------}}}
