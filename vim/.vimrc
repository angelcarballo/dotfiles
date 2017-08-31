" Plugins  ------------------------------------------------------------{{{

" be iMproved
set nocompatible

" initialize minpac
packadd minpac
call minpac#init()

" Basic plugins
call minpac#add('kana/vim-textobj-user')            " custom text object support
call minpac#add('tpope/vim-vinegar')                " file manager improvements
call minpac#add('tpope/vim-repeat')                 " extend repeat support
call minpac#add('tpope/vim-unimpaired')             " multiple mappings using [ & ]
call minpac#add('tpope/vim-sleuth')                 " auto set indent settings based on filetype
call minpac#add('stefandtw/quickfix-reflector.vim') " allow changes from quickfix window
call minpac#add('AndrewRadev/splitjoin.vim')        " split/join statements (gS, gJ)
call minpac#add('tpope/vim-abolish')                " fancy substitutions and coercion
call minpac#add('wincent/terminus')                 " enhancements for terminal vim (focus events, cursor, etc.)

" Git
call minpac#add('tpope/vim-fugitive')               " git integration
call minpac#add('tpope/vim-rhubarb')                " github integration
call minpac#add('junegunn/gv.vim')                  " git commit navigation
call minpac#add('airblade/vim-gitgutter')           " real time git-diff

" Languages & frameworks
call minpac#add('vim-ruby/vim-ruby')                " Ruby support
call minpac#add('tpope/vim-rake')                   " Rake integration
call minpac#add('tpope/vim-rbenv')                  " Rbenv integration
call minpac#add('tpope/vim-rails')                  " Rails integration
call minpac#add('tpope/vim-bundler')                " Bundler integration
call minpac#add('cakebaker/scss-syntax.vim')        " SCSS syntax
call minpac#add('kchmck/vim-coffee-script')         " CoffeeScript support

" Motions & Operators
call minpac#add('tpope/vim-surround')               " alter surroundings (), [], '', {}
call minpac#add('tommcdo/vim-exchange')             " text exchange operator (cx..)
call minpac#add('vim-scripts/ReplaceWithRegister')  " replace without yanking operator (gr..)

" Text objects
call minpac#add('nelstrom/vim-textobj-rubyblock')   " ruby block text object <r>
call minpac#add('whatyouhide/vim-textobj-erb')      " ERB block text object <E>
call minpac#add('kana/vim-textobj-entire')          " entire buffer text object <e>
call minpac#add('michaeljsmith/vim-indent-object')  " indentation based text object <i/I>
call minpac#add('b4winckler/vim-angry')             " function argument text object <a/A>

" Look & Feel
call minpac#add('pgdouyon/vim-evanesco')            " remove search highlight on cursor move
call minpac#add('chriskempson/base16-vim')          " base16 colorschemes

" Navigation
call minpac#add('junegunn/fzf')                      " basic fzf support
call minpac#add('junegunn/fzf.vim')                  " fzf helpers
call minpac#add('bronson/vim-visual-star-search')    " search visual selected text with '*'
call minpac#add('dietsche/vim-lastplace')            " restore cursor position when re-opening files

" Auto completion
call minpac#add('ervandew/supertab')                " magic code auto complete!
call minpac#add('tpope/vim-endwise')                " auto close for Vim blocks
call minpac#add('jiangmiao/auto-pairs')             " auto close for (, [, {
call minpac#add('docunext/closetag.vim')            " auto close for Html tags

" Third party integration
call minpac#add('christoomey/vim-tmux-navigator')   " navigate to tmux panes from Vim
call minpac#add('benmills/vimux')                   " tmux integration
call minpac#add('tpope/gem-ctags')                  " include tags from installed gems
call minpac#add('jez/vim-superman')                 " better man pager
call minpac#add('Townk/dash.vim')                   " Dash integration for documentation lookups
call minpac#add('linluk/vim-websearch')             " web searches from vim buffers

" Runners
call minpac#add('skalnik/vim-vroom')                " ruby test runner
call minpac#add('tpope/vim-eunuch')                 " run common UNIX commands for the current file

" Extras
call minpac#add('tommcdo/vim-lion')                 " code align (like on this comment)
call minpac#add('tpope/vim-commentary')             " comment/uncomment code
call minpac#add('AndrewRadev/switch.vim')           " easy switches
call minpac#add('christoomey/vim-system-copy')      " copy command (cp), copy current line (cP) and paste in next line (cv)
call minpac#add('xolox/vim-notes')                  " easy note taking
call minpac#add('xolox/vim-misc')                   " required by vim-notes
call minpac#add('tpope/vim-capslock')               " software caps lock (gC / <c-g>c)

"}}}
" Plugin options ---------------------------------------------------------------{{{

" gitgutter options
let g:gitgutter_signs = 0

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

"" Vromm configuration
let g:vroom_map_keys=0
let g:vroom_cucumber_path='rspec'
let g:vroom_spec_command='rspec'
let g:vroom_use_vimux=1
let g:vroom_options={'options':'--fail-fast'}

"" Vim-Notes options
let g:notes_directories=['~/Dropbox/notes']
let g:notes_tab_indents=0
let g:notes_conceal_code=0
let g:notes_conceal_italic=0
let g:notes_conceal_bold=0
let g:notes_conceal_url=0

"" vim-websearch options
let g:web_search_command = "open"
let g:web_search_query = "https://www.google.co.uk/search?q="

"" Vim-Switch options
let g:switch_custom_definitions=
      \ [
      \   ['yes', 'no'],
      \   ['TODO', 'DONE'],
      \   ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop']
      \ ]

"}}}
" General settings ------------------------------------------------------------{{{

" map leader to <space>
let mapleader="\<Space>"

set autowrite                        " autowrite after make, ! and friends
set complete-=i                      " searching includes can be slow
set encoding=utf-8                   " use UTF8 by default
set number                           " show line numbers
set showcmd                          " show complete commands
set ruler                            " show cursor position
set scrolloff=3                      " leave space after the current line
set foldmethod=marker                " fold using {{{ .. }}} markers
set diffopt+=vertical                " always use vertical diffs
set mouse+=a                         " enable mouse support in (a)ll modes
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
set gdefault                         " make substitution global by default

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden\ --ignore\ .git
endif


" Make the mouse (*gasp*) usable on large screens
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

autocmd FocusGained * source ~/.vim_colorscheme                  " reload colorscheme
autocmd QuickFixCmdPost *grep* nested cwindow | redraw!          " open quickfix window after using Grep
autocmd FileType qf wincmd J                                     " quickfix window should always be full width

runtime macros/matchit.vim           " allow % to match more than just single characters

"}}}
" Look & Feel ------------------------------------------------------------------{{{

" enable truecolor (24 bit)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

syntax on
set background=dark

set visualbell                 " visual flash
set noerrorbells               " no flash on errors, only at beginning/end of file
set laststatus=2               " always show status bar
set showtabline=1              " only show tab bar if needed
set listchars=tab:▸\ ,trail:·  " symbols for invisible characters
set list                       " show extra whitespace
let &showbreak='↳ '            " indicator for wrapped lines

" statusline
set statusline=                                     " custom status line
set statusline+=%#PmenuSel#                         " color...
set statusline+=\ %{StatuslineGit()}                " git branch
set statusline+=%#Pmenu#                            " color...
set statusline+=\ %f                                " relative path
set statusline+=%m                                  " modified flag
set statusline+=%r                                  " read only flag
set statusline+=%h                                  " help flag
set statusline+=%w                                  " preview flag
set statusline+=%=                                  " right align the following ...
set statusline+=\ %p%%                              " percentage through file
set statusline+=\ ☰\ %c:%l/%L\                         " line number/total lines
set statusline+=%#error#                            " color ...
set statusline+=%{StatuslineTrailingSpaceWarning()} " trailing whitespacee indicator
set statusline+=%{StatuslineTabWarning()}           " mixed indentation indicator
set statusline+=%*                                  " reset color

" background config managed by base16
if filereadable(expand("~/.vim_colorscheme"))
  let base16colorspace=256
  source ~/.vim_colorscheme
endif

" automatically re balance windows on Vim resize
autocmd VimResized * :wincmd =

" highlight trailing spaces
match ErrorMsg '\s\+$'

" highlight character 121 to avoid long lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%121v', 100)

"}}}
" Files to ignore -------------------------------------------------------------{{{

set wildignore+=*.swp,*.bak,*.pyc,*.class,*.lock       " Common
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
nnoremap <leader><tab> <c-^>

" /,? - Search in project
nnoremap <leader>/ :silent Ggrep ""<left>
nnoremap <leader>? :silent Ggrep "" "**" ":!spec/"<c-left><c-left><left><left>

" * - Search in project for word under cursor
nnoremap <leader>* :silent Ggrep "<c-r><c-w>"<cr>
nnoremap <leader>8 :silent Ggrep "<c-r><c-w>"<cr>
vnoremap <leader>* "hy:silent Ggrep "<c-r>h"<cr>
vnoremap <leader>8 "hy:silent Ggrep "<c-r>h"<cr>

" a - Auto
" auto correct spelling mistake
nnoremap <leader>ac [s1z=

" b - Buffers
nnoremap <silent> <leader>bd :bdelete<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>bD :w <bar> %bd <bar> e#<cr>

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
  nnoremap <leader>cfl :let @+=join([expand('%'),  line(".")], ':')<cr>:echo "File path including line number copied"<cr>
endif
" clear search results (both highlight and quickfix window)
nnoremap <silent> <leader>cs :nohl<cr>:cclose<cr>
" clear git status window
nnoremap <silent> <leader>cg <c-w>k<c-w>c
" open quickfix window
nnoremap <silent> <leader>co :Copen<cr>

" d - Duplicate
nnoremap <leader>dp yap:Commentary<cr>}p
nnoremap <leader>dl yy:Commentary<cr>p
vnoremap <leader>dl ygv:Commentary<cr>']p

" e - Explore
nnoremap <silent> <leader>ei :Explore<cr>
nnoremap <silent> <leader>es :Sex<cr>
nnoremap <silent> <leader>ev :Vex<cr>

" f - File/Find
nnoremap <leader>fl <c-^>
nnoremap <leader>fs :up<cr>
nnoremap <silent> <leader>fd :Files %:p:h<cr>
nnoremap <silent> <leader>ff :GFiles<cr>
nnoremap <silent> <leader>fg :GFiles?<cr>
nnoremap <silent> <leader>fr :History<cr>
nnoremap <silent> <leader>ft :FZF spec/<cr>

nnoremap <leader>fm :silent Ggrep "def <c-r><c-w>"<cr>
nnoremap <leader>fM :silent Ggrep "def self.<c-r><c-w>"<cr>
nnoremap <leader>fc :silent Ggrep "class <c-r><c-w>"<cr>
nnoremap <leader>fC :silent Ggrep "module <c-r><c-w>"<cr>

" g - Git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gc :Gcommit<cr>i
nnoremap <leader>gf :Gfetch<cr>
nnoremap <leader>gd :Gdiff HEAD<cr>
nnoremap <leader>gD :Gdiff master<cr>
nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gp :Gpull<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>go :Gbrowse<cr>
vnoremap <leader>go :Gbrowse<cr>
nnoremap <leader>gl :GV!<cr>
nnoremap <leader>gL :GV<cr>
vnoremap <leader>gl :GV<cr>

" h - Git Hunks (added by vim-gitgutter)
" <leader>hs -> stage hunk
" <leader>hu -> unstage hunk

" i - Indent
nnoremap <leader>ij :%!python -m json.tool<cr>

" l - Load /Last
nnoremap <leader>lg :call QuickFixGitStatus()<cr> \| :cnext<cr>
nnoremap <silent> <leader>lc `[

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
nnoremap <leader>sf :call vroom#RunTestFile(g:vroom_options)<cr>
nnoremap <leader>sc :call vroom#RunNearestTest(g:vroom_options)<cr>
nnoremap <leader>sl :call vroom#RunLastTest()<cr>

" S - Show/Snippets
nnoremap <silent> <leader>Sf :echo @%<cr>
nnoremap <silent> <leader>Sp :echo expand('%:p')<cr>
nnoremap <silent> <leader>Sb :echo "Current git branch: " . fugitive#head()<cr>

" t - Tmux/Tabs

" Send visual selection to tmux
vnoremap <silent> <leader>tl :call VimuxSlime()<cr>
" Send current line to tmux
noremap <silent> <leader>tl V:call VimuxSlime()<cr>
" Send whole file to tmux
noremap <silent> <leader>tf ggVG:call VimuxSlime()<cr>
" Other tmux interactions
nnoremap <silent> <leader>to :VimuxRunCommand("")<cr>
nnoremap <silent> <leader>ti :VimuxInspectRunner<cr>
nnoremap <silent> <leader>tc :VimuxCloseRunner<cr>
nnoremap <silent> <leader>tt :VimuxZoomRunner<cr>
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
nnoremap <leader>x :Dispatch<cr>

"}}}
" Mappings (other) ---------------------------------------------------------------{{{

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better paste from register
inoremap <c-r> :Reg<cr>

" Search documentation for word under cursor
nmap <silent> K <Plug>DashSearch

" Easily exit insert mode
inoremap kj <esc>

" select last inserted text
nnoremap gV `[v`]


" search for word under cursor in normal mode
nnoremap gw :WebSearchCursor<cr>
" search for selection in visual mode
vnoremap gw :WebSearchVisual<cr>

" allows incsearch highlighting for range commands
cnoremap &t <CR>:t''<CR>
cnoremap &m <CR>:m''<CR>
cnoremap &d <CR>:d<CR>``

" type triple ':::' to open the command line window
cnoremap :: <c-f>

" Fix closest spelling error
inoremap <c-\> <c-g>u<esc>[s1z=`]a<c-g>u

" Auto indent pasted text
nnoremap p p=`]<c-o>
nnoremap P P=`]<c-o>

" Search and replace current selection
vnoremap <c-r> "hy:%s/<c-r>h//g<left><left>

" Delete lines and word from insert mode
inoremap <c-d> <esc>ddi
inoremap <c-w> <esc>bdiwi

" Move around using visual lines, useful when wrap is enabled
" if a count is provided, default j/k behaviour is used
" and jumps bigger thank 5 lines are added to the jumplist
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Use arrow keys to resize splits
nnoremap <up> :resize -5<cr>
nnoremap <down> :resize +5<cr>
nnoremap <left> :vertical resize -10<cr>
nnoremap <right> :vertical resize +10<cr>

" Easily run macros on selected lines
vnoremap @ :norm@<cr>

" Easily run the last command on selected lines
xnoremap . :norm.<cr>

" Make Y behave like other capitals (yank from cursor to end of line)
nnoremap Y y$

" Easy beginning/end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Unimpaired style next/previews tab
nnoremap [w :tabp<cr>
nnoremap ]w :tabn<cr>

" Additions to unimpaired option toggles
nnoremap cof :set foldenable! foldenable?<cr>
nnoremap cop :set paste! paste?<cr>
nnoremap cotf :call ToggleFailFast()<cr>
nnoremap cots :call ToggleSpring()<cr>
nnoremap cotm :call ToggleVimuxTarget()<cr>
nnoremap cog :GitGutterSignsToggle<cr>

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
" Global autocommands -----------------------------------------------------------------{{{

fun! <SID>AutoMakeDirectory()
  let s:directory = expand("<afile>:p:h")

  if !isdirectory(s:directory)
    call mkdir(s:directory, "p")
  endif
endfun

" automatically generate new directories
autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()

"}}}
" Force file types -----------------------------------------------------------------{{{

autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
autocmd BufRead,BufNewFile *.prawn setfiletype ruby
autocmd BufRead,BufNewFile *.tmux setfiletype tmux
autocmd BufRead,BufNewFile *.cfg setfiletype puppet
autocmd BufRead,BufNewFile init.el setfiletype lisp
autocmd BufRead,BufNewFile .spacemacs setfiletype lisp

"}}}
" Type: Vim -----------------------------------------------------------------{{{

augroup vimgroup
  autocmd!
  autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2
augroup END

"}}}
" Type: Ruby -----------------------------------------------------------------{{{

augroup rubygroup
  autocmd!
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby let b:dispatch='ruby %'
augroup END

"}}}
" Type: Cucumber/Turnip -----------------------------------------------------------------{{{

augroup cucumbergroup
  autocmd!
  autocmd FileType cucumber setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType cucumber let b:dispatch='ruby %'
augroup END

"}}}
" Type: Python -----------------------------------------------------------------{{{

augroup pythongroup
  autocmd!
  autocmd FileType python :set tabstop=8 expandtab shiftwidth=4 softtabstop=4
  autocmd FileType python let b:dispatch='python %'
augroup END

"}}}
" Type: Scala -----------------------------------------------------------------{{{

augroup scalagroup
  autocmd!
  autocmd BufRead,BufNewFile *.hocon set filetype=yaml
  autocmd FileType scala let b:dispatch='scala -nc %'
augroup END

"}}}
" Type: Markdown --------------------------------------------------------------{{{

augroup markdowngroup
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType markdown set wrap
  autocmd FileType markdown setlocal spell textwidth=80
augroup END

"}}}
" Type: Coffeescript --------------------------------------------------------------{{{

augroup coffeescriptgroup
  autocmd!
  autocmd Filetype coffee setl shiftwidth=2 expandtab
augroup END

"}}}
" Type: Javascript --------------------------------------------------------------{{{

augroup javascriptgroup
  autocmd!
  autocmd Filetype javascript setl shiftwidth=2 expandtab
augroup END

"}}}
" Type: Git commit (Fugitive) --------------------------------------------------------------{{{

augroup gitcommit
  autocmd!
  autocmd Filetype gitcommit set spell
  autocmd Filetype gitcommit set nonu
  autocmd BufEnter .git/index call JumpToFirstGitFile()
augroup END

"}}}
" Type: Elixir -----------------------------------------------------------------{{{

augroup elixirgroup
  autocmd!
  autocmd FileType elixir let b:dispatch='elixir %'
augroup END

"}}}
" Type: Golang -----------------------------------------------------------------{{{

augroup golanggroup
  autocmd!
  autocmd FileType go let b:dispatch='go run %'
augroup END

"}}}
