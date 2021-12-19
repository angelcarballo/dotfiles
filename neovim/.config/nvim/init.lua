-- vim: foldmethod=marker foldlevel=0 foldenable

local acg = require('acg')
local map = acg.map

-- Settings {{{
vim.opt.number = true                                  -- show line numbers
vim.opt.confirm = true                                 -- ask instead of just erroring if the current file has unsaved changes
vim.opt.autowrite = true                               -- auto write after make, ! and friends
vim.opt.showcmd = true                                 -- show complete commands
vim.opt.scrolloff=3                                    -- leave space after the current line
vim.opt.swapfile = false                               -- disable swap files, let git do the work
vim.opt.splitright = true                              -- open new vertical split panes to right
vim.opt.history = 200                                  -- increase history (default: 50)
vim.opt.incsearch = true                               -- incremental search
vim.opt.ignorecase = true                              -- ignore case on search ...
vim.opt.smartcase = true                               -- ... except if query contains uppercase characters
vim.opt.infercase = true                               -- ... same thing for keyword completion
vim.opt.wrap = false                                   -- don't wrap lines when they're too long for current screen size
vim.opt.backspace = {'indent', 'eol', 'start'}         -- backspace through everything
vim.opt.wildmenu = true                                -- visual auto complete for command menu
vim.opt.wildmode = {'longest:full', 'full'}            -- complete with the longest matching substring, also show menu. Hitting tab again moves between matches
vim.opt.ttyfast = true                                 -- send extra characters to terminal (improves smoothness)
vim.opt.formatoptions:append('j')                      -- delete comment character when joining commented lines
vim.opt.autoread = true                                -- if a file changes outside Vim, reload its contents automatically
vim.opt.undofile = true                                -- persist undo history
vim.opt.breakindent = true                             -- keep indentation on wrapped lines
vim.opt.shiftwidth = 2                                 -- space identation use 2 spaces by default (file types override this)
vim.opt.tabstop = 2                                    -- tabs use 2 spaces by default (file types override this)
vim.opt.expandtab = true                               -- indent with spaces by default (override by file type)
vim.opt.regexpengine = 1                               -- use old regexp engine, as new one has low performance with big ruby files
vim.opt.spelllang = 'en_us'                            -- enable English spell check
vim.opt.spellsuggest = {'fast','20'}                   -- don't show too many suggestions for spell check
vim.opt.spellcapcheck= ''                              -- don't check for end of sentence and capitalization, it doesn't work well with abbreviations
vim.opt.dictionary:append('/usr/share/dict/words')     -- auto complete words from system dictionary
vim.opt.tags:prepend('./.git/tags')                    -- read tags from git directory
vim.opt.foldenable = false                             -- do not fold by default
vim.opt.shortmess:remove('S')                          -- show total and number of current result after a search
vim.opt.hidden = true                                  -- allow closing buffers with unsaved changes
vim.opt.mouse = 'a'                                    -- enable mouse support in all modes
vim.opt.termguicolors = true                           -- enable truecolor (24 bit)
vim.opt.visualbell = true                              -- visual flash instead of beeping
vim.opt.errorbells = false                             -- no flash on errors, only at beginning/end of file
vim.opt.laststatus = 2                                 -- always show status bar
vim.opt.list = true                                    -- show extra whitespace
vim.opt.previewheight = 20                             -- make preview bigger
vim.opt.spellfile = '~/Drive/vim/spell/en.utf-8.add'   -- point to custom spell file from Synology Drive
vim.opt.grepprg = 'rg --vimgrep --hidden --smart-case' -- use ripgrep, much faster than regular grep
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'            -- use ripgrep's format
vim.g.vimsyn_embed = 1                                 -- highlight lua and other languages inside vim files
vim.opt.diffopt = {
  'filler',                                            -- show filler lines to keep diffs aligned
  'internal',                                          -- use vim's internal diff library
  'indent-heuristic',                                  -- use vim's internal diff library for indentation
  'algorithm:histogram'                                -- histogram is better at highlighting line changes
}
vim.opt.completeopt = {
  'menu',                                              -- show popup menu for completion
  'menuone'                                            -- show popup menu even if there is only one result
}
vim.opt.complete= {
  '.',                                                 -- complete with words from current buffer
  'w',                                                 -- complete with words from other windows
}
vim.cmd [[
   set listchars=tab:▸\ ,trail:·                       " symbols for invisible characters
   let &showbreak='↳ '                                 " indicator for wrapped lines
]]
-- }}}

-- Plugins {{{
vim.cmd 'packadd cfilter' -- quickfix filter plugin (bundled with vim)

require 'paq' {
  'savq/paq-nvim';                                            -- let Paq manage itself

  -- Dependencies {{{
  'nvim-lua/plenary.nvim';                                    -- dependency for gitsigns and telescope
  -- }}}

  -- Basic {{{
  'neovim/nvim-lspconfig';                                    -- configuration for native LSP
  'kana/vim-textobj-user';                                    -- custom text object support
  'tpope/vim-repeat';                                         -- extend repeat support
  'AndrewRadev/splitjoin.vim';                                -- split/join statements (gS, gJ)
  'tpope/vim-eunuch';                                         -- basic unix shell command helpers (mv, rm, etc.)
  'pnetherwood/vim-term-focus';                               -- support for focus events when running in the terminal
  -- }}}

  -- Language support {{{
  'tpope/vim-rbenv';                                          -- Rbenv support, used to get the current ruby version on `path`
  'tpope/vim-bundler';                                        -- Bundler support, used to get the current bundled gems on `path`
  'elixir-editors/vim-elixir';                                -- Elixir support
  'aklt/plantuml-syntax';                                     -- PlantUML support
  'kchmck/vim-coffee-script';                                 -- Coffeescript support
  'pangloss/vim-javascript';                                  -- Improved Javascript syntax
  'MaxMEllon/vim-jsx-pretty';                                 -- JSX syntax
  'evanleck/vim-svelte';                                      -- Svelte syntax
  'leafgarland/typescript-vim';                               -- Typescript support
  'jxnblk/vim-mdx-js';                                        -- MDX (markdown + JSX) support
  -- }}}

  -- Git {{{
  'tpope/vim-fugitive';                                       -- git integration
  'tpope/vim-rhubarb';                                        -- github integration
  'lewis6991/gitsigns.nvim';                                  -- git signs and chunk navigation
  -- }}}

  -- Operators and commands {{{
  'tpope/vim-surround';                                       -- alter surroundings (), [], '', {}
  'tommcdo/vim-exchange';                                     -- text exchange operator (cx..)
  'vim-scripts/ReplaceWithRegister';                          -- replace without yanking operator (gr..)
  'tpope/vim-commentary';                                     -- un/comment code (gc)
  'tommcdo/vim-lion';                                         -- align code
  'Asheq/close-buffers.vim';                                  -- provides :Bdelete <type> to easily delete buffers
  -- }}}

  -- Text objects {{{
  'michaeljsmith/vim-indent-object';                          -- indentation based text object <ai>, <ii>
  'Julian/vim-textobj-variable-segment';                      -- segments of camelCase, snake_case and similar <av>, <iv>
  'glts/vim-textobj-comment';                                 -- comments text object <ic>, <ac>, <aC> to include whitespace
  'nelstrom/vim-textobj-rubyblock';                           -- ruby blocks/class/method <ar>, <ir>
  -- }}}

  -- Colorschemes and look & feel {{{
  'romainl/vim-cool';                                         -- clear search highlight automatically
  'ishan9299/nvim-solarized-lua';                             -- solarized theme implemented in lua, compabible with all solarized8 options
  'catppuccin/nvim';                                          -- colorful dark colorscheme
  -- }}}

  -- Search and completion {{{
  'windwp/nvim-autopairs';                                    -- auto close pairs (parenthesis, brackets, ...)
  'cohama/lexima.vim';                                        -- auto close do/end blocks and similar
  'alvan/vim-closetag';                                       -- auto close html/xml tags
  'nvim-telescope/telescope.nvim';                            -- generic fuzzy finder
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}; -- fzf plugin for telescope
  -- }}}

  -- Runners and navigation {{{
  'tpope/vim-projectionist';                                  -- projections for project file navigation
  'benmills/vimux';                                           -- tmux integration
  'janko-m/vim-test';                                         -- generic test runner
  'rizzatti/dash.vim';                                        -- external doc browser (Mac only)
  { 'glacambre/firenvim',                                     -- use nvim in browser textareas
    run = function() vim.fn['firenvim#install'](0) end
  };
  -- }}}
}
-- }}}

-- Forced file types {{{
acg.augroup("forced_file_types", {
    {'BufRead,BufNewFile', '*.jbuilder',   'setfiletype ruby'};
    {'BufRead,BufNewFile', '*.prawn',      'setfiletype ruby'};
    {'BufRead,BufNewFile', '*.tmux',       'setfiletype tmux'};
    {'BufRead,BufNewFile', '*tmux/*.conf', 'setfiletype tmux'};
    {'BufRead,BufNewFile', '*.cfg',        'setfiletype puppet'};
    {'BufRead,BufNewFile', 'init.el',      'setfiletype lisp'};
    {'BufRead,BufNewFile', '.spacemacs',   'setfiletype lisp'};
    {'BufRead,BufNewFile', '*.hocon',      'setfiletype yaml'};
    {'BufRead,BufNewFile', '*.md',         'setfiletype markdown'};
    {'BufRead,BufNewFile', '*.trello',     'setfiletype markdown'};
    {'BufRead,BufNewFile', '*.vader',      'setfiletype vim'};
})
-- }}}

-- Custom text object {{{

-- next parenthesis, brackets, quotes, etc. in current line
map {'o', 'inb', ':<c-u>normal! f(vi(<cr>'}
map {'o', 'in(', ':<c-u>normal! f(vi(<cr>'}
map {'o', 'in)', ':<c-u>normal! f(vi(<cr>'}
map {'o', 'inB', ':<c-u>normal! f(vi(<cr>'}
map {'o', 'in[', ':<c-u>normal! f[vi[<cr>'}
map {'o', 'in]', ':<c-u>normal! f[vi[<cr>'}
map {'o', 'in{', ':<c-u>normal! f{vi{<cr>'}
map {'o', 'in}', ':<c-u>normal! f{vi{<cr>'}
map {'o', "in'", ":<c-u>normal! f'vi'<cr>"}
map {'o', 'in"', ':<c-u>normal! f"vi"<cr>'}

-- }}}

-- Path and ignored patterns {{{
vim.opt.path:remove('/usr/include') -- include folder is added by default, no need for it
vim.opt.path:append({
  -- generic app and test paths
  'bin/**',
  'lib/**',
  'test/**',
  'script/**',
  'scripts/**',
  -- rails/ruby
  'app/**',
  'spec/**',
  -- elixir, including umbrella apps
  'priv/**',
  'apps/*/lib/**',
  'apps/*/test/**',
  'apps/*/config/**',
  'apps/*/scripts/**',
  'apps/*/priv/**',
  -- phoenix
  'assets/*',
  'assets/js/**',
  'assets/css/**',
  'assets/static/**',
  'assets/vendor/**'
})
vim.opt.wildignore:append({
  '*.swp,*.bak,*.pyc,*.class',    -- Common
  '*/tmp/*,*.so,*.zip,.DS_Store', -- MacOSX/Linux
  '*\\tmp\\*,*.zip,*.exe',        -- Windows
  '*/temp/*,*/backup/*',          -- Vim
  '*/_site/*',                    -- Jekyll
  '*/log/*,*.log',                -- log files
  '*.eof,*.ttf,*.woff',           -- font files
  '**/node_modules/**'            -- node artefacts
})
-- }}}

-- Plugin Settings {{{

-- Plugin: vim-lion
vim.g.lion_squeeze_spaces = 1 -- remove unnecessary spaces

-- Plugin: closetag
vim.g.closetag_filetypes = 'html,xhtml,erb,eelixir'

-- Plugin: vimux
vim.g['VimuxResetSequence'] = 'qC' -- for every command, send first: q -> exit scroll/copy mode, <esc> -> enter readline normal mode, C -> replace whole line
vim.g['VimuxRunnerType']='pane' -- use a pane
vim.g['VimuxOrientation'] = 'v' -- on the bottom half of the window

-- Plugin: vim-test
vim.g['test#ruby#use_binstubs'] = 1                          -- use bin/xxx when available, which should use Spring automatically
vim.g['test#ruby#rspec#options'] = {
  nearest = '--fail-fast --order 0 --format documentation',  -- for single tests, run in verbose mode
  file = '--fail-fast --order 0 --format documentation',     -- same for single file, also keep always original order to make it easier to debug errors
  suite = '--fail-fast',                                     -- for whole suite, useful to keep randomness
}
vim.g['test#python#runner'] = 'pytest'                       -- use pytest for pytong specs ...
vim.g['test#python#pytest#executable'] = 'pipenv run pytest' -- ... using the right environment
vim.g['g:test#elixir#exunit#executable'] = 'mix test'        -- use mix, this should probably be the default
vim.g['test#elixir#exunit#options'] = {
  suite = '--stale',                                         -- only run changed tests
  file = '--trace --seed 0',                                 -- for single files, run in verbose mode and in original order
  nearest = '--trace'
}
vim.cmd(                                                     -- custom strategy to avoid echoing the command to the terminal before running it
[[
  function! CustomVimuxStrategy(cmd)
    call VimuxRunCommand(a:cmd)
  endfunction
  let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
  let g:test#strategy = 'customvimux'
]])

-- Plugin: netrw
vim.g['g:netrw_liststyle']  = 0         -- thin (change to 3 for tree)
vim.g['g:netrw_banner']  = 0            -- no banner
vim.g['g:netrw_altv']  = 1              -- open files on right
vim.g['g:netrw_preview']  = 1           -- open previews vertically
vim.g['g:netrw_sizestyle']  = 'H'       -- show human style file sizes
vim.g['g:netrw_nogx']  = 1              -- disable gx url command

-- Plugin: vim-ruby
vim.g.ruby_spellcheck_strings = 1      -- enable spellcheck inside ruby strings
vim.g.ruby_minlines = 500              -- avoid syntax errors while scrolling on large files
vim.g.ruby_indent_block_style = 'do'   -- better syntax for nested blocks

-- Plugin: telescope
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.setup{
  pickers = {
    buffers = { theme = "ivy" },
    find_files = { theme = "ivy" },
    git_files = { theme = "ivy" },
    git_status = { theme = "ivy" },
    help_tags = { theme = "ivy" },
    live_grep = { theme = "ivy" },
    lsp_document_symbols = { theme = "ivy" },
    marks = { theme = "ivy" },
    oldfiles = { theme = "ivy" },
  },
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next"
      }
    }
  },
  -- extensions = {}
}

-- Plugin: projectionist
vim.cmd [[
let g:projectionist_heuristics = {
  \    "mix.exs": {
  \      "lib/*.ex": {
  \        "type": "lib",
  \        "make": "mix",
  \        "alternate": "test/{}_test.exs",
  \        "template": [
  \          "defmodule Duffel.{dirname|camelcase|capitalize|dot}.{basename|camelcase|capitalize} do",
  \          "end"
  \        ]
  \      },
  \      "test/*_test.exs": {
  \        "type": "test",
  \        "make": "iex -S mix test",
  \        "alternate": "lib/{}.ex",
  \        "template": [
  \          "defmodule Duffel.{dirname|camelcase|capitalize|dot}.{basename|camelcase|capitalize}Test do",
  \          "  use ExUnit.Case, async: true",
  \          "",
  \          "  alias {dirname|camelcase|capitalize|dot}.{basename|camelcase|capitalize}",
  \          "end"
  \        ]
  \      }
  \    }
  \  }
]]

-- Plugin: native diagnostic plugin
vim.diagnostic.config {
  virtual_text = false, -- don't show virtualtext
  signs = true,         -- but do show signs
  underline = true,     -- and underline over the diagnosed text
}
-- Use downcased sign texts
vim.fn.sign_define("DiagnosticSignError", { text = "e", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "w", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "i", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "h", texthl = "DiagnosticSignHint" })

-- Plugin: gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'Comment', text = '+', numhl='Comment', linehl='Comment'},
    change       = {hl = 'Comment', text = '~', numhl='Comment', linehl='Comment'},
    delete       = {hl = 'Comment', text = '_', numhl='Comment', linehl='Comment'},
    topdelete    = {hl = 'Comment', text = '‾', numhl='Comment', linehl='Comment'},
    changedelete = {hl = 'Comment', text = '~', numhl='Comment', linehl='Comment'},
  },
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    -- Text objects
    ['o ic'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ic'] = ':<C-U>Gitsigns select_hunk<CR>'
  }
}

-- Plugin: nvim-autopairs
require('nvim-autopairs').setup{}

-- Plugin: firenvim
vim.g.firenvim_config = {
  localSettings = {
    ['.*'] = {
        takeover = 'never'                             -- don't enable automatically
    }
  }
}
if vim.api.nvim_eval("exists('g:started_by_firenvim')") then
  vim.opt.guifont = 'Iosevka:h22'                      -- use larger font
  vim.opt.laststatus = 0                               -- hide statusline
end
acg.augroup("firenvime_file_types", {
  {'BufEnter', 'github.com_*.txt', 'set ft=markdown'}; -- default to markdown for Github
})

-- }}}

-- Look & Feel {{{

--  Colorschemes {{{
-- Colorscheme: solarized
vim.g.solarized_statusline = 'flat' -- flat variant has a less distracting statusline
vim.g.solarized_extra_hi_groups = 1 -- show filetype specific highlight groups

-- Colorscheme: catppuccin
require("catppuccin").setup({
  integrations = {
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    gitsigns = false,
    telescope = true,
  },
})
--   }}}

--  Status line {{{
local trailing_whitespace = function()
  local space = vim.fn.search([[\s\+$]], 'nwc')
  return space ~= 0 and "TW:"..space or ""
end

function status_line()
  return table.concat {
    '%#Pmenu#',            -- color
    ' %f ',                -- relative file path
    '%m',                  -- modified flag
    '%r',                  -- read-only flag
    '%h',                  -- help flag
    '%w',                  -- preview flag
    '%=',                  -- right aling the following...
    trailing_whitespace(), -- trailing space indicator
    ' %c %l/%L'            -- current column, current line and total lines
  }
end

vim.opt.statusline = "%!luaeval('status_line()')"
--  }}}

acg.auto_set_theme()

vim.cmd 'highlight clear SpellBad'                         -- remove default spell highlighting
vim.cmd 'highlight SpellBad cterm=underline gui=undercurl' -- underline spelling errors
vim.cmd 'highlight TabLineSel guifg=bg guibg=fg'           -- highlight current tab
vim.cmd "match ErrorMsg '\\s\\+$'"                         -- highlight trailing spaces
-- }}}

-- Mappings {{{
--   Basic mappings {{{
map {'i', 'kj', '<esc>'}                                   -- easily exit insert mode
map {'n', 'Q', '<nop>'}                                    -- don't go inTo Ex mode
map {'n', '<tab>', '<c-^>'}                                -- quick toggle between last two buffers
map {'n', 'j', 'gj'}                                       -- Move around using visual lines, useful when wrap is enabled
map {'n', 'k', 'gk'}
-- }}}
--   Leader mappings {{{

vim.g.mapleader = ' '                                      -- Use <sapce> as leader key
map {'n', '<leader><space>', ':b '}                        -- quick buffer switch

-- /,? - Search in project
-- Use -F by default to disable regexp and search for a literal string
map {'n', '<leader>/', ':silent grep -F ""<left>'}
map {'n', '<leader>?', ':silent grep -F -g !test ""<left>'}

-- ] - Tags
map {'n', '<silent><leader><c-]>', '<c-w><c-]><c-w>T'} -- open tag in new tab

--  * - Search in file or project
map {'x', '*', ''}
map {'n', '<leader>8', ':silent grep "<cword>"<cr>'}
map {'x', '<leader>8', '"zy:silent grep "<c-r>z"<cr>'}
map {'n', '<leader>*', ':silent grep "<cWORD>"<cr>'}

-- args
map {'n', '<leader>aa', ':argadd<cr>'}

-- b - Buffers
map {'n', '<leader>aa', ':argadd<cr>'}
map {'n', '<leader>bo', ':Bdelete hidden<cr>'}
map {'n', '<leader>bb', '<cmd>Telescope buffers<cr>'}

-- c - Copy/clear
map {'n', '<leader>cb', ':let @+=fugitive#head()<cr>:echo "<c-r>+"<cr>'} -- copy git branch
map {'n', '<leader>cfn', ':let @+=expand("%:t")<cr>:echo "<c-r>+"<cr>'} -- copy file name  (foo.txt)
map {'n', '<leader>cfp', ':let @+=expand("%")<cr>:echo "<c-r>+"<cr>'} -- copy relative path  (src/foo.txt)
map {'n', '<leader>cfP', ':let @+=expand("%:p")<cr>:echo "<c-r>+"<cr>'} -- copy absolute path  (/something/src/foo.txt)
map {'n', '<leader>cfl', ':let @+=join([expand(\'%\'),  line(".")], \':\')<cr>:echo "<c-r>+"<cr>'} -- copy relative path with line number
map {'n', '<leader>cff', ':let @+=expand("%:p:h")<cr>:echo "<c-r>+"<cr>'} -- copy file directory/folder path (src/)
map {'n', '<leader>cfd', ':let @+=expand("%:p:h")<cr>:echo "<c-r>+"<cr>'} -- copy file directory/folder path (src/)

map {'n', '<leader>co', ':Git checkout<space>'}
map {'n', '<leader>cs', ':nohl<cr>'}

-- d - Duplicate, diff, db
map {'n', '<leader>db', ':%DB<cr>'}
map {'x', '<leader>db', ':DB<cr>'}

map {'n', '<leader>dp', 'yap}p'}
map {'n', '<leader>dl', 'yy:Commentary<cr>p'}
map {'x', '<leader>dl', 'ygv:Commentary<cr>\']p'}

map {'n', '<leader>d<', ':diffget //2<cr>'}
map {'n', '<leader>d>', ':diffget //3<cr>'}

-- e - Explore/Extract
map {'x', '<leader>em', ':call ExtractMethod()<cr>'}
map {'n', '<leader>ei', ':Explore<cr>'}
map {'n', '<leader>es', ':Sex<cr>'}
map {'n', '<leader>ev', ':Vex<cr>'}

-- f - File/Find
map {'n', '<leader>fs', ':up<cr>'}
map {'n', '<leader>fa', "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>"}
map {'n', '<leader>fF', "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>"}
map {'n', '<leader>ff', "<cmd>Telescope git_files<cr>"}
map {'n', '<leader>fg', '<cmd>Telescope git_status<cr>'}
map {'n', '<leader>fr', '<cmd>Telescope oldfiles<cr>'}
map {'n', '<leader>fh', '<cmd>Telescope help_tags<cr>'}
map {'n', '<leader>fm', '<cmd>Telescope marks<cr>'}
map {'n', '<leader>ft', '<cmd>Telescope live_grep<cr>'}
map {'n', '<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>'}

-- g - Git/Generate
map {'n', '<leader>gg', ':Git<space>'}
map {'n', '<leader>gD', ':Gdiffsplit origin/main<cr>'}
map {'n', '<leader>gb', ':Git blame<cr>'}
map {'n', '<leader>gd', ':Gdiffsplit<cr>'}
map {'n', '<leader>gf', ':GitStatusFiles<cr><c-w>k:redraw!<cr>'}
map {'n', '<leader>gh', ':GBrowse<cr>'}
map {'x', '<leader>gh', ':GBrowse<cr>'}
map {'n', '<leader>gH', ':GBrowse!<cr>'}
map {'x', '<leader>gH', ':GBrowse!<cr>'}
map {'n', '<leader>gl', ':vert Git log -n 50<cr>'}
map {'n', '<leader>gL', ':0Gclog -n 50<cr>'}
map {'x', '<leader>gl', ':Gclog -n 50<cr>'}
map {'n', '<leader>grc', ':Git rebase --continue<cr>'}
map {'n', '<leader>gp', ':Git pull<cr>'}
map {'n', '<leader>gP', ':Git push<cr>'}
map {'n', '<leader>gr', ':Gread<cr>'}
map {'n', '<leader>gc', ':Git commit<cr>'}
map {'n', '<leader>ga', ':Git commit --amend<cr>'}
map {'n', '<leader>gs', ':Git|wincmd T<cr>'}
map {'n', '<leader>gw', ':Gwrite<cr>'}
map {'n', '<leader>g/', ':Git log -S\'\'<left>'}

-- k - Keyword documentation
map {'n', '<leader>k', ':Dash<cr>'}

-- q - Quit
map {'n', '<leader>q', ':q<cr>'}
map {'n', '<leader>Q', ':qall!<cr>'}

-- n - notes
map {'n', '<leader>nn', ':execute "edit ".luaeval(\'require("acg").notes_path()\')<cr>'}

--" o - open
map {'n', '<leader>of', ":! open '%'<cr>"}
map {'n', '<leader>on', ':FZF $NOTES/<cr>'}

--" r - Remove, redraw
map {'n', '<leader>rd', ':redraw!<cr>'}

--" s - Specs/Split
map {'n', '<leader>sa', ':TestSuite<cr>'}
map {'n', '<leader>sf', ':TestFile<cr>'}
map {'n', '<leader>sc', ':TestNearest<cr>'}
map {'n', '<leader>sl', ':TestLast<cr>'}
map {'n', '<leader>sg', ':TestVisit<cr>'}

-- S - Show
map {'n', '<leader>Sf', ':echo @%<cr>'}
map {'n', '<leader>Sp', ':echo expand(\'%:p\')<cr>'}
map {'n', '<leader>Sb', ':echo "Git branch: " . fugitive#head()<cr>'}

-- T - Tabs/tmux
map {'n', '<leader>tn', ':tabnew<cr>'}
map {'n', '<leader>tq', ':VimuxCloseRunner<cr>'}
map {'n', '<leader>to', ':VimuxRunCommand("")<cr>'}
map {'n', '<leader>tl', ':VimuxRunLastCommand<cr>'}
map {'n', '<leader>tt', ':VimuxRunCommand("")<left><left>'}
map {'n', '<leader>t:', 'VimuxRunCommand("")<left><left>'}
-- interrupt twice to auto-confirm
map {'n', '<leader>tc', ':VimuxInterruptRunner<cr>:VimuxInterruptRunner<cr>'}

-- V - Vimrc
map {'n', '<leader>Ve', ':edit $MYVIMRC<cr>'}
map {'n', '<leader>Vs', ':source $MYVIMRC<cr>'}

-- w - Windows/Tabs
map {'n', '<leader>wo', ':only<cr>'}
map {'n', '<leader>we', '<c-w>='}
map {'n', '<leader>ws', ':sp<cr>'}
map {'n', '<leader>wt', ':tabedit %<cr>'}
map {'n', '<leader>wv', ':vsp<cr>'}

--   }}}
--    Non-leader mappings {{{

 -- Use Tab for aucocompletion
map {'i', '<tab>', '<c-r>=Tab_Or_Complete()<cr>'}

-- pane navigation
map {'n', '<c-h>', '<c-w>h'}
map {'n', '<c-j>', '<c-w>j'}
map {'n', '<c-k>', '<c-w>k'}
map {'n', '<c-l>', '<c-w>l'}

-- Fix closest spelling error
map {'i', '<c-f>', '<c-g>u<esc>[s1z=`]a<c-g>u'}

-- format whole file and keep position (original map formats current line which is not that useful)
map {noremap = false, 'n', 'gqq', 'mzgggqG`z'}

-- Search and replace current visual selection
map {'x', '<c-r>', '"zy:%s/<c-r>z//g<left><left>'}

-- Use cursors to resize windows
map {'n', '<left>', ':vertical resize -3<cr>'}
map {'n', '<right>', ':vertical resize +3<cr>'}
map {'n', '<down>', ':resize +3<cr>'}
map {'n', '<up>', ':resize -3<cr>'}

-- Use cursors to move lines in visual mode
map {'x', '<up>', ':move \'<-2<cr>gv=gv'}
map {'x', '<down>', ':move \'>+<cr>gv=gv'}

-- and to increase/decrease indentation
map {'x', '<right>', '>gv'}
map {'x', '<left>', '<gv'}

-- Easy beginning/end of line
map {'n', 'H', '^'}
map {'n', 'L', '$'}
map {'x', 'H', '^'}
map {'x', 'L', '$'}

--   }}}
--   Unimpaired style {{{

-- previous/next file in current folder
map {'n', ']f', ":<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(v:count1), ':.'))<cr><cr>"}
map {'n', '[f', ":<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(-v:count1), ':.'))<cr><cr>"}

map {'n', ']a', ':next<cr>'}
map {'n', '[a', ':previous<cr>'}

map {'n', '[b', ':bprevious<cr>'}
map {'n', ']b', ':bnext<cr>'}

map {'n', '[q', ':cprevious<cr>'}
map {'n', ']q', ':cnext<cr>'}

map {'n', '[Q', ':cfirst<cr>'}
map {'n', ']Q', ':clast<cr>'}

map {'n', '[l', ':lprevious<cr>'}
map {'n', ']l', ':lnext<cr>'}

map {'n', '[w', ':tabprevious<cr>'}
map {'n', ']w', ':tabnext<cr>'}

map {'n', '[t', ':pop<cr>'}
map {'n', ']t', ':tag<cr>'}

-- Add new line above/bellow current one
map {'n', '[<space>', ':call append(line(".") -1, "")<cr>'}
map {'n', ']<space>', ':call append(line("."), "")<cr>'}

map {'n', 'coC', ':setlocal cursorcolumn! cursorcolumn?<cr>'}
map {'n', 'coc', ':setlocal cursorline! cursorline?<cr>'}
map {'n', 'cof', ':setlocal foldenable! foldenable?<cr>'}
map {'n', 'coh', ':setlocal hlsearch! hlsearch?<cr>'}
map {'n', 'col', ':call ToggleLocation()<cr>'}
map {'n', 'com', ':call ToggleExUnit()<cr>'}
map {'n', 'con', ':setlocal number! number?<cr>'}
map {'n', 'cop', ':setlocal paste! paste?<cr>'}
map {'n', 'coq', ':call ToggleQuickFix()<cr>'}
map {'n', 'cos', ':setlocal spell! spell?<cr>'}
map {'n', 'cot', ':call ToggleVimuxTarget()<cr>'}
map {'n', 'cow', ':setlocal wrap! wrap?<cr>'}

--   }}}
--   Operators {{{

-- web search operator
map {'n', 'gs', ':set opfunc=WebSearch<cr>g@'}
map {'x', 'gs', ':<c-u>call WebSearch(visualmode(), 1)<cr>'}

-- copy to system clipboard
map {'n', 'cP', 'V"+y'}
map {'n', 'cp', '"+y'}
map {'x', 'cp', '"+y'}

-- send text to tmux operator
map {'n', 'gt', ':set opfunc=SendTextToTmux<cr>g@'}
map {'n', 'gtt', 'V:<c-u>call SendTextToTmux(visualmode(), 1)<cr>'}
map {'x', 'gt', ':<c-u>call SendTextToTmux(visualmode(), 1)<cr>'}

--   }}}
-- }}}

-- LSP {{{

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- skip buffers with special URI, e.g. fugitive://...
  if vim.api.nvim_buf_get_name(bufnr):match "^%a+://" then
    return
  end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map {'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>'}
  map {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'}
  map {'n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>'}
  map {'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'}
  map {'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'}
  map {'n', "coe", '<cmd>lua vim.diagnostic.setqflist({open = true})<CR>'}
end

-- efm-langserver runs credo
require 'lspconfig'.efm.setup{
  filetypes = {'elixir', 'eelixir'};
}

require 'lspconfig'.elixirls.setup{
  cmd = { "/Users/angel/src/elixir-ls/release/language_server.sh" };
  filetypes = {'elixir', 'eelixir'};
  on_attach = on_attach;
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = true
    }
  };
}

-- }}}

-- Autocommands {{{
acg.augroup('quickfix_window', {
  {'QuickFixCmdPost', 'grep cwindow | redraw!'};               -- open quickfix window after using grep
  {'QuickFixCmdPost', 'lgrep redraw!'};                        -- open location window after using grep
  {'FileType', 'qf wincmd J'};                                 -- quickfix window should always be full width
})

acg.augroup('help_window', {
  {'FileType', 'help', 'wincmd L'};                            -- open help always on the right
})

acg.augroup('commit_window', {
  {'FileType', 'gitcommit', 'wincmd L'};                       -- open commit always on the right
})

acg.augroup('quickfix_after_make', {
  {'QuickFixCmdPost', '[^l]*', 'nested cwindow'};              -- open quickfix window after make
  {'QuickFixCmdPost', 'l*', 'nested lwindow'};                 -- open location window after lmake
})

acg.augroup('branch_notes', {
  {'Bufread,BufNewFile', '*/.git/notes-*', 'set ft=markdown'}; -- own notes are all markdown
})

acg.augroup('detect_file_changes', {
  {'FocusGained,BufEnter', '*', ':silent! checktime'};
})

-- acg.augroup('detect_theme_changes', {
--   {                                                            -- auto switch theme when MacOs does
--     'FocusGained,FocusLost',
--     '*',
--     'lua require("acg").auto_set_theme()'
--   };
-- })

acg.augroup('lsp_auto_formatting', {
  {                                                            -- auto format files that support it via LSP
    'BufWritePre',
    '*.ex,*.exs',
    'lua vim.lsp.buf.formatting_sync(nil, 100)'
  };
})

acg.augroup('preview_window', {
  {                                                            -- close preview window automatically
    'CursorMovedI,InsertLeave',
    '*',
    'if pumvisible() == 0|pclose|endif'
  }
})

-- }}}

-- Footer {{{
--[[

Loading order:
1. This file: init.lua
2. Files under /plugin
3. Files under /after

See `:scriptnames` for a list of all scripts, in evaluation order.

Launch Neovim with `nvim --startuptime nvim.log` for profiling info.

To see all leader mappings, including those from plugins:
  nvim -c 'map <Leader>'
  nvim -c 'map <LocalLeader>'

--]]
-- }}}
