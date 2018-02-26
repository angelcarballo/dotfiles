" Plugins  ------------------------------------------------------------{{{

" initialize minpac
packadd minpac
call minpac#init()

" Basic plugins
call minpac#add('kana/vim-textobj-user')            " custom text object support
call minpac#add('tpope/vim-vinegar')                " file manager improvements
call minpac#add('tpope/vim-repeat')                 " extend repeat support
call minpac#add('tpope/vim-unimpaired')             " multiple mappings using [ & ]
call minpac#add('tpope/vim-sleuth')                 " auto set indent settings based on filetype
call minpac#add('AndrewRadev/splitjoin.vim')        " split/join statements (gS, gJ)
call minpac#add('wincent/terminus')                 " enhancements for terminal vim (focus events, cursor, etc.)

" Git
call minpac#add('tpope/vim-fugitive')               " git integration
call minpac#add('tpope/vim-rhubarb')                " github integration

" Languages & frameworks
call minpac#add('sheerun/vim-polyglot')             " syntax support for comon filetypes
call minpac#add('tpope/vim-rbenv')                  " Rbenv integration
call minpac#add('tpope/vim-rails')                  " Rails integration
call minpac#add('tpope/vim-bundler')                " Bundler integration
call minpac#add('vim-scripts/nagios-syntax')        " Nagios support

" Motions & Operators
call minpac#add('tpope/vim-surround')               " alter surroundings (), [], '', {}
call minpac#add('tommcdo/vim-exchange')             " text exchange operator (cx..)
call minpac#add('vim-scripts/ReplaceWithRegister')  " replace without yanking operator (gr..)

" Text objects
call minpac#add('kana/vim-textobj-entire')             " entire buffer text object <e>
call minpac#add('michaeljsmith/vim-indent-object')     " indentation based text object <i/I>
call minpac#add('b4winckler/vim-angry')                " function argument text object <a/A>
call minpac#add('Julian/vim-textobj-variable-segment') " segments of camelcase, snakecase and similar <v>

" Look & Feel
call minpac#add('chriskempson/base16-vim')          " base16 colorschemes

" Navigation
call minpac#add('junegunn/fzf')                      " basic fzf support
call minpac#add('junegunn/fzf.vim')                  " fzf helpers
call minpac#add('bronson/vim-visual-star-search')    " search visual selected text with '*'
call minpac#add('dietsche/vim-lastplace')            " restore cursor position when re-opening files
call minpac#add('pgdouyon/vim-evanesco')             " improved (*) search

" Auto completion
call minpac#add('ervandew/supertab')                " magic code auto complete!
call minpac#add('tpope/vim-endwise')                " auto close for Vim blocks
call minpac#add('jiangmiao/auto-pairs')             " auto close for (, [, {

" Third party integration
call minpac#add('christoomey/vim-tmux-navigator')   " navigate to tmux panes from Vim
call minpac#add('tpope/gem-ctags')                  " include tags from installed gems
call minpac#add('Townk/dash.vim')                   " Dash integration for documentation lookups
call minpac#add('linluk/vim-websearch')             " web searches from vim buffers

" Runners
call minpac#add('benmills/vimux')                   " tmux integration
call minpac#add('janko-m/vim-test')                 " generic test runner
call minpac#add('tpope/vim-eunuch')                 " run common UNIX commands for the current file
call minpac#add('tpope/vim-dispatch')               " run commands asynchronously

" Extras
call minpac#add('godlygeek/tabular')                " code align (like on this comment)
call minpac#add('tpope/vim-commentary')             " comment/uncomment code
call minpac#add('christoomey/vim-system-copy')      " copy command (cp), copy current line (cP) and paste in next line (cv)
call minpac#add('tpope/vim-capslock')               " software caps lock (gC / <c-g>c)

"}}}
" Plugin options ---------------------------------------------------------------{{{

" vim-test options
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pipenv run pytest'
let test#ruby#use_binstubs = 0
let test#ruby#rspec#options = '--fail-fast'

" Custom strategy to avoid echoing command
function! CustomVimuxStrategy(cmd)
  call VimuxRunCommand(a:cmd)
endfunction
let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
let g:test#strategy = 'customvimux'

"" Netrw options
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_sizestyle='H'       " show human style file sizes

"" Vim-ruby options
let ruby_spellcheck_strings=1      " enable spellcheck inside ruby strings
let ruby_minlines=200              " avoid syntax errors while scrolling on large files
let g:ruby_indent_block_style='do' " better syntax for nested blocks

"" vim-websearch options
let g:web_search_command = "open"
let g:web_search_query = "https://www.google.com/search?q="

"}}}
" General settings ------------------------------------------------------------{{{

" map leader to <space>
let mapleader="\<Space>"

set autowrite                        " autowrite after make, ! and friends
set complete-=i                      " searching includes can be slow
set encoding=utf-8                   " use UTF8 by default (in case $LANG has a different value)
set number                           " show line numbers
set showcmd                          " show complete commands
set ruler                            " show cursor position
set scrolloff=3                      " leave space after the current line
set foldmethod=marker                " fold using {{{ .. }}} markers
set diffopt+=vertical                " always use vertical diffs
set noswapfile                       " disable swap files, let git do the work
set splitright                       " open new vertical split panes to right
set history=200                      " increase history (default: 50)
set hlsearch                         " highlight search results
set incsearch                        " incremental search
set ignorecase                       " ignore case on search ...
set smartcase                        " ... except if query contains uppercase characters
set infercase                        " ... same thing for keyword completion
set nowrap                           " don't wrap lines
set backspace=indent,eol,start       " backspace through everything
set wildmenu                         " visual auto complete for command menu
set ttyfast                          " send extra characters to terminal (improves smoothness)
set lazyredraw                       " redraw only when needed
set formatoptions+=j                 " delete comment character when joining commented lines
set omnifunc=syntaxcomplete#Complete " enable omni completion
set magic                            " eval special character as 'special' by default, for example . is any character, and \. is a dot
set autoread                         " if a file changes outside Vim, reload its contents automatically
set undofile                         " persist undo history
set undodir=$HOME/.vim/undo          " where to store undo files
set nojoinspaces                     " only insert one space when joining after an '.'
set breakindent                      " keep indentation on wrapped lines
set tabstop=4                        " tabs use 4 spaces by default (filetypes override this)
set expandtab                        " indent with spaces by default (overriden by filetype)
set regexpengine=1                   " use old regexp engine, as new one has low performance with big ruby files
set spell spelllang=en_us            " enable english spell check
set spellsuggest=fast,20             " don't show too much suggestion for spell check.
set spellfile=~/Dropbox/vim/spell/en.utf-8.add
" Extended mouse support
if !has('nvim')
  set ttymouse=xterm2
endif

if executable('rg')
  " Use ripgrep over Grep
  set grepprg=rg\ --vimgrep
endif

autocmd QuickFixCmdPost *grep* nested cwindow | redraw!          " open quickfix window after using Grep, grep, vimgrep
autocmd FileType qf wincmd J                                     " quickfix window should always be full width

runtime macros/matchit.vim           " allow % to match more than just single characters
filetype plugin indent on            " enable indentation by filetype

"}}}
" Look & Feel ------------------------------------------------------------------{{{

" enable truecolor (24 bit)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

syntax on
set background=dark
set visualbell                 " visual flash instead of beeping
set noerrorbells               " no flash on errors, only at beginning/end of file
set laststatus=2               " always show status bar
set listchars=tab:▸\ ,trail:·  " symbols for invisible characters
set list                       " show extra whitespace
let &showbreak='↳ '            " indicator for wrapped lines

" statusline
set statusline=                                     " custom status line
set statusline+=%#Menu#                             " color...
set statusline+=\ %{strpart(StatuslineGit(),0,14)}\ " git branch
set statusline+=%#Pmenu#                            " color...
set statusline+=\ %f\                               " relative path
set statusline+=%m                                  " modified flag
set statusline+=%r                                  " read only flag
set statusline+=%h                                  " help flag
set statusline+=%w                                  " preview flag
set statusline+=%=                                  " right align the following ...
set statusline+=\ %c:%l/%L                          " column:row/total lines
set statusline+=\ %p%%\                             " percentage through file
set statusline+=%#error#                            " color ...
set statusline+=%{StatuslineTrailingSpaceWarning()} " trailing whitespacee indicator
set statusline+=%{StatuslineTabWarning()}           " mixed indentation indicator
set statusline+=%*                                  " reset color

" colorscheme config managed by base16
if filereadable(expand("~/.vim_colorscheme"))
  let base16colorspace=256
  source ~/.vim_colorscheme
  " hide split borders
  highlight VertSplit guibg=bg guifg=bg
endif

" highlight trailing spaces
match ErrorMsg '\s\+$'

" highlight character 111 to avoid long lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%111v', 100)

highlight clear SpellBad
highlight SpellBad cterm=underline

"}}}
" Files to ignore -------------------------------------------------------------{{{

set wildignore+=*.swp,*.bak,*.pyc,*.class              " Common
set wildignore+=*/tmp/*,*.so,*.zip,.DS_Store           " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.zip,*.exe                  " Windows
set wildignore+=*/temp/*,*/backup/*                    " Vim
set wildignore+=*/_site/*                              " Jekyll
set wildignore+=*/log/*,*.log                          " log files
set wildignore+=*.eof,*.ttf,*.woff                     " font files

"}}}
" Abbreviations -------------------------------------------------------------{{{

iabbr rk =>
iabbr lorem Lorem ipsum dolor sit amet
iabbr plorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
iabbr bpry require 'pry'; binding.pry
iabbr classdescription #== Description
      \<cr>
      \<cr>
iabbr pdb import pdb; pdb.set_trace()

"}}}
" Skeletons -------------------------------------------------------------{{{

autocmd BufNewFile *_spec.rb 0read ~/.vim/skeleton/rspec.rb
autocmd BufNewFile *.sh 0read ~/.vim/skeleton/bash.sh
autocmd BufNewFile *factories/*.rb 0read ~/.vim/skeleton/factory_girl.rb

"}}}
" Mappings (leader) ---------------------------------------------------------------{{{

" Show and switch to buffers
nmap <leader><space> :buffers<cr>:bu<Space>
nmap <tab> <c-^>

" , - Show and paste from registers
nnoremap <leader>, :Reg<cr>

" <leader> - Switch between the last two files
nnoremap <leader><tab> :tabn<cr>

" /,? - Search in project
nnoremap <leader>/ :silent Ggrep ""<left>
nnoremap <leader>? :silent Ggrep "" "**" ":!spec/"<c-left><c-left><left><left>

" * - Search in project for word under cursor
nnoremap <leader>* :silent Ggrep "<c-r><c-w>"<cr>
nnoremap <leader>8 :silent Ggrep "<c-r><c-w>"<cr>
xnoremap <leader>* "hy:silent Ggrep "<c-r>h"<cr>
xnoremap <leader>8 "hy:silent Ggrep "<c-r>h"<cr>

" a - Auto/Align
" auto correct spelling mistake
nnoremap <leader>ac [s1z=
" align
nnoremap <leader>aa :Tabularize /
inoremap <leader>aa :Tabularize /

" b - Buffers
nnoremap <silent> <leader>bd :bdelete<cr>
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

  " relative path with line number
  nnoremap <leader>cfl :let @*=join([expand('%'),  line(".")], ':')<cr>:echo "File path including line number copied"<cr>
endif
" clear search results (both highlight and quickfix window)
nnoremap <silent> <leader>cs :nohl<cr>:cclose<cr>
" clear git status window
nnoremap <silent> <leader>cg <c-w>k<c-w>c
" open quickfix window
nnoremap <silent> <leader>co :Copen<cr>

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
nnoremap <silent> <leader>fd :Files %:p:h<cr>
nnoremap <silent> <leader>ff :GFiles<cr>
nnoremap <silent> <leader>fF :Ag<cr>
nnoremap <silent> <leader>fg :GFiles?<cr>
nnoremap <silent> <leader>fr :History<cr>
nnoremap <silent> <leader>ft :FZF spec/<cr>
nnoremap <silent> <leader>fh :Helptags<cr>

nnoremap <leader>fm :silent Ggrep "def <c-r><c-w>"<cr>
nnoremap <leader>fM :silent Ggrep "def self.<c-r><c-w>"<cr>
nnoremap <leader>fc :silent Ggrep "class <c-r><c-w>"<cr>
nnoremap <leader>fC :silent Ggrep "module <c-r><c-w>"<cr>

" g - Git
nnoremap <leader>gs :Gstatus<cr>
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

" i - Indent
nnoremap <leader>ij :%!python -m json.tool<cr>

" l - Load /Last
nnoremap <leader>lg :call QuickFixGitStatus()<cr> \| :cnext<cr>
nnoremap <silent> <leader>lc `[
nnoremap <silent> <leader>ll :<up><cr>

" o - open
nnoremap <leader>of :! open '%'<cr>

" pry
nnoremap <leader>pry Orequire 'pry'; binding.pry

" P - Plugins
nnoremap <leader>Pi :PackUpdate<cr>
nnoremap <leader>Pu :PackUpdate<cr>
nnoremap <leader>Pc :PackClean<cr>

" q - Quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qall!<cr>

" r - Remove
nnoremap <silent> <leader>rw :%s/\s\+$//<cr>:w<cr>
nnoremap <leader>rd :redraw!<cr>

" s - Specs
nnoremap <leader>sa :TestSuite<cr>
nnoremap <leader>sf :TestFile<cr>
nnoremap <leader>sc :TestNearest<cr>
nnoremap <leader>sl :TestLast<cr>
nnoremap <leader>sg :TestVisit<cr>

" S - Show/Snippets
nnoremap <silent> <leader>Sf :echo @%<cr>
nnoremap <silent> <leader>Sp :echo expand('%:p')<cr>
nnoremap <silent> <leader>Sb :echo "Current git branch: " . fugitive#head()<cr>

" t - Tmux/Tabs

" Run current file dispatch-like
nnoremap <silent> <leader>tt :VimuxRunCommand("ruby " . bufname("%"))<cr>
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
nnoremap <silent> <leader>wc :wq<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>we <c-w>=
nnoremap <silent> <leader>ws :sp<cr>
nnoremap <silent> <leader>wt :tabedit %<cr>
nnoremap <silent> <leader>wv :vsp<cr>
nnoremap <silent> <leader>ww <c-w>w

" x - eXecute
nnoremap <leader>xd :Dispatch<cr>
nnoremap <leader>xm :Make<cr>
nnoremap <leader>xb !!bash<cr>

"}}}
" Mappings (other) ---------------------------------------------------------------{{{

" Increment/decrement numbers using +/-
noremap + <C-a>
noremap - <C-x>

" Increment/decrement visually selected numbers using +/-
xnoremap + g<C-a>
xnoremap - g<C-x>

" Better paste from register
inoremap <c-v> :Reg<cr>

" Search documentation for word under cursor
nnoremap <silent> K <Plug>DashSearch

" Easily exit insert mode
inoremap kj <esc>

" select last inserted text
nnoremap gV `[v`]

" search for word under cursor in normal mode
nnoremap gs :WebSearchCursor<cr>
" search for selection in visual mode
xnoremap gs :WebSearchVisual<cr>

" allows incsearch highlighting for range commands
" i.e. search with /,? and then copy with &t
cnoremap &c <cr>:copy''<cr>
cnoremap &t <cr>:copy''<cr>
cnoremap &m <cr>:move''<cr>
cnoremap &d <cr>:delete<cr>``

" Fix closest spelling error
inoremap <c-f> <c-g>u<esc>[s1z=`]a<c-g>u

" Auto indent pasted text
nnoremap p p=`]<c-o>
nnoremap P P=`]<c-o>

" Search and replace current visual selection
xnoremap <c-r> "hy:%s/<c-r>h//g<left><left>

" Delete lines and word from insert mode
inoremap <c-d> <esc>ddi
inoremap <c-w> <esc>bdiwi

" Move around using visual lines, useful when wrap is enabled
" if a count is provided, default j/k behaviour is used
" and jumps bigger thank 5 lines are added to the jumplist
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Move lines/blocks
xnoremap K :m '<-2<cr>gv=gv
xnoremap J :m '>+1<cr>gv=gv
xnoremap < <<<cr>gv
xnoremap > >><cr>gv

" Easily run macros on selected lines
xnoremap @ :norm@

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
nnoremap cotf :call ToggleFailFast()<cr>
nnoremap cots :call ToggleSpring()<cr>
nnoremap cotm :call ToggleVimuxTarget()<cr>
nnoremap cos :setlocal scrollbind! scrollbind?<cr>

" Exit neovim terminal mode like insert mode
if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif


"}}}
" Motions ---------------------------------------------------------------{{{

" In next <surround object> motions
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

"}}}
" Commands -----------------------------------------------------------------{{{

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"}}}
" Force file types -----------------------------------------------------------------{{{

autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
autocmd BufRead,BufNewFile *.prawn setfiletype ruby
autocmd BufRead,BufNewFile *.tmux setfiletype tmux
autocmd BufRead,BufNewFile *.cfg setfiletype puppet
autocmd BufRead,BufNewFile init.el setfiletype lisp
autocmd BufRead,BufNewFile .spacemacs setfiletype lisp
autocmd BufRead,BufNewFile *.hocon setfiletype yaml
autocmd BufRead,BufNewFile *.md setfiletype markdown

"}}}
