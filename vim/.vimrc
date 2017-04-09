" Plugins  ------------------------------------------------------------{{{

set nocompatible                          " be iMproved

" initialize vim-plug
call plug#begin('~/.vim/plugged')

" Basic plugins
Plug 'kana/vim-textobj-user'            " custom text object support
Plug 'eiginn/netrw'                     " file manager
Plug 'tpope/vim-vinegar'                " file manager improvements
Plug 'tpope/vim-repeat'                 " extend repeat support
Plug 'tpope/vim-unimpaired'             " multiple mappings using [ & ]
Plug 'tpope/vim-sleuth'                 " auto set indent settings based on filetype
Plug 'stefandtw/quickfix-reflector.vim' " allow changes from quickfix window
Plug 'AndrewRadev/splitjoin.vim'        " split/join statements (gS, gJ)

" Git
Plug 'tpope/vim-fugitive'               " git integration
Plug 'tpope/vim-rhubarb'                " github integration
Plug 'junegunn/gv.vim'                  " git commit navigation
Plug 'airblade/vim-gitgutter'           " real time git-diff

" Languages & frameworks
Plug 'vim-ruby/vim-ruby'                                                        " Ruby support
Plug 'tpope/vim-rake'                                                           " Rake integration
Plug 'tpope/vim-rbenv'                                                          " Rbenv integration
Plug 'tpope/vim-rails'                                                          " Rails integration
Plug 'tpope/vim-bundler'                                                        " Bundler integration
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}                               " SCSS syntax
Plug 'othree/html5.vim', {'for': 'html'}                                        " HTML5 support
Plug 'elzr/vim-json', {'for': 'html'}                                           " Json support
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}                             " Markdown support
Plug 'pprovost/vim-markdown-jekyll', {'for': 'markdown'}                        " Jekyll style markdown support
Plug 'pangloss/vim-javascript', {'for': 'javascript'}                           " improved Javascript support
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}                        " Typescript support
Plug 'mustache/vim-mustache-handlebars', {'for': ['mustache', 'html.mustache']} " Mustache support
Plug 'rodjek/vim-puppet', {'for': 'puppet'}                                     " Puppet support
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}                                   " Tmux syntax support
Plug 'derekwyatt/vim-scala', {'for': 'scala'}                                   " Scala syntax support
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}                              " CoffeeScript support
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}                                " Elixir support

" Motions & Operators
Plug 'tpope/vim-surround'               " alter surroundings (), [], '', {}
Plug 'tommcdo/vim-exchange'             " text exchange operator (cx..)
Plug 'vim-scripts/ReplaceWithRegister'  " replace without yanking operator (gr..)
Plug 'gavinbeatty/dragvisuals.vim'      " move visual blocks around
Plug 'rstacruz/vim-xtract'              " extract blocks into new files

" Text objects
Plug 'nelstrom/vim-textobj-rubyblock'   " ruby block text object <r>
Plug 'whatyouhide/vim-textobj-erb'      " ERB block text object <E>
Plug 'kana/vim-textobj-entire'          " entire buffer text object <e>
Plug 'michaeljsmith/vim-indent-object'  " indentation based text object <i/I>
Plug 'b4winckler/vim-angry'             " function argument text object <a/A>

" Look & Feel
Plug 'yggdroot/indentLine'               " show indentation lines
Plug 'pgdouyon/vim-evanesco'             " remove search highlight on cursor move
Plug 'vim-airline/vim-airline'           " better status bar
Plug 'vim-airline/vim-airline-themes'    " themes for airline
Plug 'kshenoy/vim-signature'             " better mark management

" Navigation
Plug '/usr/local/opt/fzf'                " homebrew version of fzf
Plug 'junegunn/fzf.vim'                  " fzf-vim for fzf helpers
Plug 'bronson/vim-visual-star-search'    " search visual selected text with '*'
Plug 'cyphactor/vim-open-alternate'      " open alternate files (i.e. implementation/spec)
Plug 'szw/vim-maximizer'                 " maximize/restore windows
Plug 'dietsche/vim-lastplace'            " restore cursor position when re-opening files
Plug 'gabesoft/vim-ags'                  " because sometimes grep is not enough
Plug 'easymotion/vim-easymotion'         " quick jumps across lines/files/characters
Plug 'majutsushi/tagbar'                 " navigate current file tags

" Colorschemes
Plug 'chriskempson/base16-vim'          " base16 colorschemes

" Auto completion
Plug 'ervandew/supertab'                " magic code auto complete!
Plug 'tpope/vim-endwise'                " auto close for Vim blocks
Plug 'jiangmiao/auto-pairs'             " auto close for (, [, {
Plug 'docunext/closetag.vim'            " auto close for Html tags

" Third party integration
Plug 'christoomey/vim-tmux-navigator'     " navigate to tmux panes from Vim
Plug 'benmills/vimux'                     " tmux integration
Plug 'tpope/gem-ctags'                    " include tags from installed gems
Plug 'jez/vim-superman'                   " better man pager
Plug 'wincent/terminus'                   " enhancements for terminal vim (focus events, cursor, etc.)
Plug 'Townk/dash.vim'                     " Dash integration for documentation lookups

" Runners
Plug 'skalnik/vim-vroom'                " ruby test runner
Plug 'tpope/vim-dispatch'               " run processes on the background
Plug 'tpope/vim-eunuch'                 " run common UNIX commands for the current file

" Extras
Plug 'godlygeek/tabular'                " code align (like on this comment)
Plug 'tpope/vim-commentary'             " comment/uncomment code
Plug 'AndrewRadev/switch.vim'           " easy switches
Plug 'christoomey/vim-system-copy'      " copy command (cp), copy current line (cP) and paste in next line (cv)
Plug 'xolox/vim-notes'                  " easy note taking
Plug 'xolox/vim-misc'                   " required by vim-notes
Plug 'tpope/vim-capslock'               " software caps lock (gC / <c-g>c)
Plug 'szw/vim-g'                        " perform google searches

" Plugins must be added before the following line
call plug#end()

"}}}
" Plugin options ---------------------------------------------------------------{{{

"" Easymotion options
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

"" Instant markdown preview options
let g:instant_markdown_autostart = 0

"" Dragvisuals options
let g:DVB_TrimWS = 1            " delete whitespace after duplicating

"" Netrw options
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

"" Vim-ruby options
let ruby_spellcheck_strings=1   " enable spellcheck inside ruby strings
let ruby_minlines=200           " avoid syntax errors while scrolling on large files

"" IndentLine options
let g:indentLine_char='·'

"" Vim Json options
let g:vim_json_syntax_conceal=0

"" Vromm configuration
let g:vroom_map_keys=0
let g:vroom_cucumber_path='rspec'
let g:vroom_spec_command='rspec'
let g:vroom_use_vimux=1
let g:vroom_options={'options':'--fail-fast'}

"" Markdown options
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal=0

"" Ags (The Silver Searcher)
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden\ --ignore\ .git
endif

let g:ags_agcontext = 2

"" Vim-Notes options
let g:notes_directories=['~/Dropbox/notes']
let g:notes_tab_indents=0
let g:notes_conceal_code=0
let g:notes_conceal_italic=0
let g:notes_conceal_bold=0
let g:notes_conceal_url=0

"" Change vim-voogle mapping
let g:voogle_map = "gO"

"" Vim-Switch options
let g:switch_custom_definitions=
      \ [
      \   ['yes', 'no'],
      \   ['TODO', 'DONE'],
      \   ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop']
      \ ]

"" Vim-maximizer options
let g:maximizer_set_default_mapping=1

"}}}
" General settings ------------------------------------------------------------{{{

" map leader to <space>
let mapleader="\<Space>"

set encoding=utf-8                   " use UTF8 by default
set number                           " show line numbers
set showcmd                          " show complete commands
set ruler                            " show cursor position
set scrolloff=3                      " leave space after the current line
set foldmethod=marker                " fold using {{{ .. }}} markers
set diffopt+=vertical                " always use vertical diffs
set mouse+=a                         " enable mouse support in (a)ll modes
if &term =~ '^screen'
  set ttymouse=xterm2                " enable mouse support under tmux
endif
set noswapfile                       " disable swap files, let git do the work
set splitright                       " open new vertical split panes to right
set history=1000                     " max history
set hlsearch                         " highlight search results
set incsearch                        " incremental search
set ignorecase                       " ignore case on search ...
set smartcase                        " ... except if query contains uppercase characters
set nowrap                           " don't wrap lines
set backspace=indent,eol,start       " backspace through everything
set wildmenu                         " visual auto complete for command menu
set lazyredraw                       " redraw only when needed
set formatoptions+=j                 " delete comment character when joining commented lines
set omnifunc=syntaxcomplete#Complete " enable omni completion
set timeoutlen=500                   " don't wait so long for the next key press
set magic                            " eval special character as 'special' by default, for example . is any character, and \. is a dot
set autoread                         " if a file changes outside Vim, reload its contents automatically
set undofile                         " persist undo history
set undolevels=1000                  " max undo levels
set undodir=$HOME/.vim/undo          " where to store undo files
set nojoinspaces                     " only insert one space when joining after an '.'
set breakindent                      " keep indentation on wrapped lines

autocmd BufLeave,FocusLost * silent! wa                 " auto save files
autocmd FocusGained * source ~/.vim_colorscheme         " reload colorscheme
autocmd QuickFixCmdPost *grep* nested cwindow | redraw! " open quickfix window after using Grep
autocmd FileType qf wincmd J                            " quickfix window should always be full width

runtime macros/matchit.vim           " allow % to match more than just single characters

"}}}
" Look & Feel ------------------------------------------------------------------{{{

" enable truecolor (24 bit)
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

set background=dark
set visualbell                 " visual flash
set noerrorbells               " no flash on errors, only at beginning/end of file
set laststatus=2               " always show status bar
set showtabline=1              " only show tab bar if needed
set listchars=tab:▸\ ,trail:·  " symbols for invisible characters
set list                       " show extra whitespace
let &showbreak='↳ '            " indicator for wrapped lines

" Airline configuration
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_skip_empty_sections=1
let g:airline_theme='base16_shell'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#displayed_head_limit=15
let g:airline#extensions#ctrlp#color_template='normal'
" hide section x (tagbar, filetype, virtualenv)
let g:airline_section_x=airline#section#create('')
" hide section y (fileencoding, fileformat)
let g:airline_section_y=airline#section#create('')
" hide mode indicator
let g:airline_section_a=airline#section#create(['crypt','paste','spell','iminsert'])

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

ab mojon () =>
ab bpry require 'pry'; binding.pry
ab classdescription #== Description
      \<cr>
      \<cr>
"}}}
" Skeletons -------------------------------------------------------------{{{

autocmd BufNewFile *_spec.rb 0read ~/.vim/skeleton/rspec.rb
autocmd BufNewFile *.sh 0read ~/.vim/skeleton/bash.sh
autocmd BufNewFile *factories/*.rb 0read ~/.vim/skeleton/factory_girl.rb

"}}}
" Key bindings (leader) ---------------------------------------------------------------{{{

" move to {char}{char}
nmap <leader><space> :buffers<cr>:bu<Space>

" , - Search lines on opened buffers
nnoremap <leader>, :Lines<cr>

" <leader> - Switch between the last two files
nnoremap <leader><tab> <c-^>

" [, ] - Move between tabs
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" /,? - Search in project
nnoremap <leader>/ :silent Ggrep ""<left>
nnoremap <leader>? :silent Ggrep "" "**" ":!spec/"<c-left><c-left><left><left>

" \,| - Align tables
vnoremap <leader>\ :Tabularize /<bar><cr>
vnoremap <leader><bar> :Tabularize /<bar><cr>

" * - Search in project for word under cursor
nnoremap <leader>* :silent Ggrep "<c-r><c-w>"<cr>
nnoremap <leader>8 :silent Ggrep "<c-r><c-w>"<cr>
vnoremap <leader>* "hy:silent Ggrep "<c-r>h"<cr>

" a - Align/Auto
vnoremap <leader>aa :Tabularize /
vnoremap <leader>a= :Tabularize /=<cr>
vnoremap <leader>a> :Tabularize /=><cr>
vnoremap <leader>a<bar> :Tabularize /<bar><cr>
" auto correct spelling mistake
nnoremap <leader>ac [s1z=

" b - Buffers
nnoremap <silent> <leader>bd :bdelete<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>bD :w <bar> %bd <bar> e#<cr>

" c - Copy/Clear/Close
if has("mac") || has("gui_macvim") || has("gui_mac")
  " copy git branch
  nnoremap <leader>cb :let @*=fugitive#head()<cr>:echo "Git branch copied"<cr>

  " copy relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<cr>:echo "File path copied"<cr>

  " copy absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<cr>:echo "Full file path copied"<cr>

  " relative path with line number
  nnoremap <leader>cl :let @+=join([expand('%'),  line(".")], ':')<cr>:echo "File path including line number copied"<cr>
endif
" clear search results (both highlight and quickfix window)
nnoremap <silent> <leader>cs :nohl<cr>:cclose<cr>
" clear git status window
nnoremap <silent> <leader>cg <c-w>k<c-w>c

" d - Duplicate
nnoremap <leader>dp yap}p
nnoremap <leader>dl yy:Commentary<cr>p
vnoremap <leader>dl ygv:Commentary<cr>']p

" e - Explore
nnoremap <silent> <leader>ei :Explore<cr>
nnoremap <silent> <leader>es :Sex<cr>
nnoremap <silent> <leader>ev :Vex<cr>

" f - File/Find
nnoremap <leader>fa :OpenAlternate<cr>
nnoremap <leader>fA :vsplit<cr>:OpenAlternate<cr>
nnoremap <leader>fl <c-^>
nnoremap <leader>fs :up<cr>
nnoremap <silent> <leader>fd :Files %:p:h<cr>
nnoremap <silent> <leader>ff :GFiles<cr>
nnoremap <silent> <leader>fg :GFiles?<cr>
nnoremap <silent> <leader>fr :History<cr>
nnoremap <silent> <leader>ft :TagbarToggle<cr>

nnoremap <leader>fm :silent Ggrep "def <c-r><c-w>"<cr>
nnoremap <leader>fM :silent Ggrep "def self.<c-r><c-w>"<cr>
nnoremap <leader>fc :silent Ggrep "class <c-r><c-w>"<cr>
nnoremap <leader>fC :silent Ggrep "module <c-r><c-w>"<cr>

" g - Git/Google
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gq :call QuickFixGitStatus()<cr>:copen<cr>:cfirst<cr>
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
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gL :GV<cr>
vnoremap <leader>gl :Glog<cr>

nnoremap <leader>gg :Google<cr>
vnoremap <leader>gg :Google<cr>

" h - Git Hunks (added by vim-gitgutter)
" <leader>hs -> stage hunk
" <leader>hu -> unstage hunk

" i - Indent
nnoremap <leader>ij :%!python -m json.tool<cr>

" l - Load /Last
nnoremap <leader>lg :call QuickFixGitStatus()<cr> \| :cnext<cr>
nnoremap <silent> <leader>lc `[

" n - Notes/Numbers
nnoremap <leader>nr :RecentNotes<cr>
nnoremap <leader>ns :SearchNotes<space>
nnoremap <leader>nn :Note<space>
vnoremap <leader>nc :NoteFromSelectedText<space>

" o - Open
nnoremap <silent> <leader>om :Emodel<space>
nnoremap <silent> <leader>oc :Econtroller<space>
nnoremap <silent> <leader>os :Espec<space>
nnoremap <silent> <leader>oi :Einitializer<space>
nnoremap <silent> <leader>ov :Eview<space>
nnoremap <silent> <leader>oq :cw<cr>

" P - Plugins
nnoremap <leader>Pi :PlugInstall<cr>
nnoremap <leader>Pc :PlugClean<cr>
nnoremap <leader>Pu :PlugUpdate<cr>
nnoremap <leader>Pg :PlugUpgrade<cr>

" q - Quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qall!<cr>

" r - Remove/Refactor
nnoremap <silent> <leader>rw :%s/\s\+$//<cr>:w<cr>

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
vnoremap <silent> <leader>tt :call VimuxSlime()<cr>
" Send current line to tmux
noremap <silent> <leader>tt V:call VimuxSlime()<cr>
" Send whole file to tmux
noremap <silent> <leader>tf ggVG:call VimuxSlime()<cr>
" Other tmux interactions
nnoremap <silent> <leader>to :VimuxRunCommand("")<cr>
nnoremap <silent> <leader>ti :VimuxInspectRunner<cr>
nnoremap <silent> <leader>tc :VimuxCloseRunner<cr>
nnoremap <silent> <leader>tz :VimuxZoomRunner<cr>
" Tab management
nnoremap <silent> <leader>tn :tabnew<cr>

" V - Vimrc
nnoremap <leader>Ve :e $MYVIMRC<cr>
nnoremap <leader>Vs :so $MYVIMRC<cr>

" w - Windows/Tabs
nnoremap <silent> <leader>wc :wq<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>wC :only<cr>
nnoremap <silent> <leader>we <c-w>=
nnoremap <silent> <leader>wf :MaximizerToggle<cr>
nnoremap <silent> <leader>ws :sp<cr>
nnoremap <silent> <leader>wv :vsp<cr>
nnoremap <silent> <leader>ww <c-w>w

" x - eXecute
nnoremap <leader>x :Dispatch<cr>

"}}}
" Key bindings (other) ---------------------------------------------------------------{{{

" Easily exit insert mode
inoremap kj <esc>

" Easily exit insert mode
nmap <silent> K <Plug>DashSearch

" Move by two consecutive characters (any direction or window)
nmap s <Plug>(easymotion-overwin-f2)

" Delete using black hole register
nnoremap <bs> "_d
inoremap <bs> "_d

" Fix closest spelling error
nnoremap <c-\> [s1z=``
inoremap <c-\> <c-g>u<esc>[s1z=`]a<c-g>u

" Quick save and close
nnoremap <c-q> :wq!<cr>

" Auto indent pasted text
nnoremap p p=`]<c-o>
nnoremap P P=`]<c-o>

" Search and replace current selection
vnoremap <c-r> "hy:%s/<c-r>h//g<left><left>

" Delete lines and word from insert mode
inoremap <c-d> <esc>ddi
inoremap <c-w> <esc>bdiwi

" Uppercase current word
inoremap <c-u> <esc>gUiwea

" Move around using visual lines, useful when wrap is enabled
nnoremap <silent> k gk
nnoremap <silent> j gj

" Quick region expand in visual mode
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)

" Use arrow keys to resize splits
nnoremap <up> :resize -5<cr>
nnoremap <down> :resize +5<cr>
nnoremap <left> :vertical resize -10<cr>
nnoremap <right> :vertical resize +10<cr>

" Easily run macros on selected lines
vnoremap @ :norm@<cr>

" Make Y behave like other capitals (yank from cursor to end of line)
nnoremap Y y$

" Easy beginning/end of line
nnoremap H ^
nnoremap L $

" Easy next/previews tab
nnoremap [w :tabp<cr>
nnoremap ]w :tabn<cr>

" Additions to unimpaired option toggles
nnoremap cof :set foldenable! foldenable?<cr>
nnoremap cop :set paste! paste?<cr>
nnoremap cotf :call ToggleFailFast()<cr>
nnoremap cots :call ToggleSpring()<cr>
nnoremap cotm :call ToggleVimuxTarget()<cr>

" Dragvisuals, move visual block around
vmap  <expr>  <left>   DVB_Drag('left')
vmap  <expr>  <right>  DVB_Drag('right')
vmap  <expr>  <down>   DVB_Drag('down')
vmap  <expr>  <up>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

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
" Global autocommands -----------------------------------------------------------------{{{

fun! <SID>AutoMakeDirectory()
    let s:directory = expand("<afile>:p:h")

    if !isdirectory(s:directory)
        call mkdir(s:directory, "p")
    endif
endfun

autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()

"}}}
" Force file types -----------------------------------------------------------------{{{

autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
autocmd BufRead,BufNewFile *.prawn setfiletype ruby
autocmd BufRead,BufNewFile *.tmux setfiletype tmux
autocmd BufRead,BufNewFile *.cfg setfiletype puppet

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
  autocmd FileType markdown setlocal spell
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
augroup END

"}}}
" Type: Elixir -----------------------------------------------------------------{{{

augroup rubygroup
  autocmd!
  autocmd FileType elixir let b:dispatch='elixir %'
augroup END

"}}}
