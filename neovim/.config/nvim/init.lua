-- vim: foldmethod=marker foldlevel=0 foldenable

local acg = require('acg') -- Utility functions
local map = acg.map        -- Alias since it's used a lot

-- {{{ Packer setup
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end
-- }}}
-- {{{ Plugins
require('packer').startup(function(use)
  -- Core {{{
  use 'wbthomason/packer.nvim' -- Let packer manage itself
  use 'tpope/vim-repeat';      -- Extended repeat support
  use 'justinmk/vim-dirvish';  -- File manager
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  -- }}}
  -- Version control (git) {{{
  use 'tpope/vim-fugitive';      -- Git integration
  use 'tpope/vim-rhubarb';       -- Github integration for vim-fugitive
  use 'lewis6991/gitsigns.nvim'; -- Git signs and chunk navigation
  -- }}}
  -- Language support {{{
  use 'tpope/vim-sleuth'            -- Detect tabstop and shiftwidth automatically
  use 'gpanders/editorconfig.nvim'; -- Support for .editorconfig files
  use 'tpope/vim-rbenv';            -- Rbenv support, used to get the current ruby version on `path`
  use 'tpope/vim-bundler';          -- Bundler support, used to get the current bundled gems on `path`
  use 'elixir-editors/vim-elixir';  -- Elixir support
  use 'mhinz/vim-mix-format';       -- Elixir formatter support
  use 'aklt/plantuml-syntax';       -- PlantUML support
  use 'kchmck/vim-coffee-script';   -- Coffeescript support
  use 'pangloss/vim-javascript';    -- Improved Javascript syntax
  use 'MaxMEllon/vim-jsx-pretty';   -- JSX syntax
  use 'leafgarland/typescript-vim'; -- Typescript support
  use 'jxnblk/vim-mdx-js';          -- MDX (markdown + JSX) support
  -- }}}
  -- Text objects {{{
  use 'kana/vim-textobj-user';               -- Custom text object support
  use 'michaeljsmith/vim-indent-object';     -- Indentation based text object <ai>, <ii>
  use 'Julian/vim-textobj-variable-segment'; -- Segments of camelCase, snake_case and similar <av>, <iv>
  -- }}}
  -- Operators and commands {{{
  use 'AndrewRadev/splitjoin.vim';       -- Split/join statements (gS, gJ)
  use 'tpope/vim-surround';              -- Alter surroundings (), [], '', {}
  use 'tpope/vim-abolish';               -- Work with word variants (change casing, smart substitute, etc.)
  use 'tommcdo/vim-exchange';            -- Text exchange operator (cx..)
  use 'vim-scripts/ReplaceWithRegister'; -- Replace without yanking operator (gr..)
  use 'numToStr/Comment.nvim'            -- "gc" to comment visual regions/lines
  use 'tommcdo/vim-lion';                -- Align code
  use 'Asheq/close-buffers.vim';         -- Provides :Bdelete <type> to easily delete buffers
  use 'rizzatti/dash.vim';               -- Open Dash documentation tool
  -- }}}
  -- Search and completion {{{
  use 'cohama/lexima.vim';  -- Auto close do/end blocks and similar
  use 'alvan/vim-closetag'; -- Auto close html/xml tags
  -- Fuzzy Finder
  use { 'ibhagwan/fzf-lua' }
  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use 'github/copilot.vim'
  -- }}}
  -- Runners and navigation {{{
  use 'tpope/vim-eunuch';        -- Basic unix shell command helpers (mv, rm, etc.)
  use 'tpope/vim-projectionist'; -- Projections for project file navigation
  use 'benmills/vimux';          -- Tmux integration
  use 'janko-m/vim-test';        -- Generic test runner
  use 'rmagatti/auto-session';   -- Auto save & restore sessions (per folder, per branch, etc.)
  use 'kwkarlwang/bufjump.nvim'; -- Navigate through files in the jumplist
  -- }}}
  -- Look & Feel {{{
  use 'ray-x/lsp_signature.nvim';                                 -- Show hint about function arguments as you type
  use 'romainl/vim-cool';                                         -- Clear search highlight automatically
  use { "mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" } -- Contrast based themes
  -- }}}

  if is_bootstrap then
    require('packer').sync()
  end
end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
-- }}}
-- Plugin Settings {{{
--   vim-dirvish {{{
vim.g.dirvish_mode = ":sort ,^.*[\\/]," -- Show folders first
vim.g.loaded_netrwPlugin = 1            -- Disable netrw and replace its commands
vim.cmd [[
  command! -nargs=? -complete=dir Explore Dirvish <args>
  command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
  command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
]]
--  }}}
--   vim-lion {{{
vim.g.lion_squeeze_spaces = 1 -- Remove unnecessary spaces
--  }}}
--   closetag {{{
vim.g.closetag_filetypes = 'html,xhtml,erb,eelixir'
--  }}}
--   vimux {{{
vim.g['VimuxResetSequence'] =
'qC'                             -- For every command, send first: q -> exit scroll/copy mode, <esc> -> enter readline normal mode, C -> replace whole line
vim.g['VimuxRunnerType'] = 'pane' -- Use a pane
vim.g['VimuxOrientation'] = 'v'   -- On the bottom half of the window
--  }}}
--   vim-test {{{
vim.g['test#ruby#use_binstubs'] = 1                          -- Use bin/xxx when available, which should use Spring automatically
vim.g['test#ruby#rspec#options'] = {
  nearest = '--fail-fast --order 0 --format documentation',  -- For single tests, run in verbose mode
  file = '--fail-fast --order 0 --format documentation',     -- Same for single file, also keep always original order to make it easier to debug errors
  suite = '--fail-fast',                                     -- For whole suite, useful to keep randomness
}
vim.g['test#python#runner'] = 'pytest'                       -- Use pytest for pytong specs ...
vim.g['test#python#pytest#executable'] = 'pipenv run pytest' -- ... using the right environment
vim.g['g:test#elixir#exunit#executable'] = 'mix test'        -- Use mix, this should probably be the default
vim.g['test#elixir#exunit#options'] = {
  suite = '--stale',                                         -- Only run changed tests
  file = '--trace --seed 0',                                 -- For single files, run in verbose mode and in original order
  nearest = '--trace'
}
vim.cmd( -- Custom strategy to avoid echoing the command to the terminal before running it
  [[
  function! CustomVimuxStrategy(cmd)
    call VimuxRunCommand(a:cmd)
  endfunction
  let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
  let g:test#strategy = 'customvimux'
]])
--  }}}
--   vim-ruby {{{
vim.g.ruby_spellcheck_strings = 1    -- Enable spellcheck inside ruby strings
vim.g.ruby_minlines           = 500  -- Avoid syntax errors while scrolling on large files
vim.g.ruby_indent_block_style = 'do' -- Better syntax for nested blocks
--  }}}
--   fzf-lua {{{
require("fzf-lua").setup {
  winopts = {
    height = 0.3,
    width = 1,
    row = 1,
    col = 0,
    -- disable all previews by default
    preview = { hidden = 'hidden' }
  }
}
--  }}}
--   projectionist {{{
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
--  }}}
--   diagnostic {{{
vim.diagnostic.config {
  virtual_text = false, -- Don't show virtualtext
  signs = true,         -- But do show signs
  underline = true,     -- And underline over the diagnosed text
}
-- Use downcased sign texts
vim.fn.sign_define("DiagnosticSignError", { text = "e", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "w", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "i", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "h", texthl = "DiagnosticSignHint" })
--  }}}
--   gitsigns {{{
require('gitsigns').setup {
  keymaps = {
    -- Default keymap options
    noremap = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'" },
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'" },
    -- Text objects
    ['o ic'] = ':<c-u>Gitsigns select_hunk<cr>',
    ['x ic'] = ':<c-u>Gitsigns select_hunk<cr>'
  }
}
--  }}}
--   auto-session {{{
require("auto-session").setup({
  auto_session_use_git_branch = true,
  auto_restore_enabled = false
})
--   }}}
-- {{{ treesitter
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'elixir', 'python', 'ruby', 'javascript', 'typescript', 'help', 'lua' },

  highlight = { enable = true },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        -- Duplicated mappings to cover (c)lass and (m)odule
        ['am'] = '@class.outer',
        ['im'] = '@class.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    Move = {
      Enable = true,
      Set_jumps = true, -- Whether to set jumps in the jumplist
      Goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      Goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      Goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      Goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
-- }}}
-- {{{ comment.nvim
require('comment').setup()
-- }}}
-- {{{ lsp_signature
require "lsp_signature".setup({
  floating_window = false, -- Don't show function documentation, that can be triggered manually with K when needed
  hint_prefix = "» "      -- default is a panda emoji...
})
-- }}}
-- {{{ vim-mix-format
vim.g.mix_format_on_save = 0
vim.g.mix_format_silent_errors = 1 -- do not open a window with stacktrace if the formatter errors
-- }}}
-- }}}
-- Settings {{{
vim.cmd('packadd cfilter')                             -- Quickfix filter plugin (bundled with vim)
vim.opt.number = true                                  -- Show line numbers
vim.opt.confirm = true                                 -- Ask instead of just erroring if the current file has unsaved changes
vim.opt.autowrite = true                               -- Auto write after make, ! and friends
vim.opt.showcmd = true                                 -- Show complete commands
vim.opt.scrolloff = 3                                  -- Leave space after the current line
vim.opt.swapfile = false                               -- Disable swap files, let git do the work
vim.opt.splitright = true                              -- Open new vertical split panes to right
vim.opt.history = 200                                  -- Increase history (default: 50)
vim.opt.incsearch = true                               -- Incremental search
vim.opt.ignorecase = true                              -- Ignore case on search ...
vim.opt.smartcase = true                               -- ... except if query contains uppercase characters
vim.opt.infercase = true                               -- ... same thing for keyword completion
vim.opt.wrap = false                                   -- Don't wrap lines when they're too long for current screen size
vim.opt.backspace = { 'indent', 'eol', 'start' }       -- Backspace through everything
vim.opt.wildmenu = true                                -- Visual auto complete for command menu
vim.opt.wildmode = { 'longest:full', 'full' }          -- Complete with the longest matching substring, also show menu. Hitting tab again moves between matches
vim.opt.ttyfast = true                                 -- Send extra characters to terminal (improves smoothness)
vim.opt.formatoptions:append('j')                      -- Delete comment character when joining commented lines
vim.opt.autoread = true                                -- If a file changes outside Vim, reload its contents automatically
vim.opt.undofile = true                                -- Persist undo history
vim.opt.breakindent = true                             -- Keep indentation on wrapped lines
vim.opt.shiftwidth = 2                                 -- Space identation use 2 spaces by default (file types override this)
vim.opt.tabstop = 2                                    -- Tabs use 2 spaces by default (file types override this)
vim.opt.expandtab = true                               -- Indent with spaces by default (override by file type)
vim.opt.regexpengine = 1                               -- Use old regexp engine, as new one has low performance with big ruby files
vim.opt.spelllang = 'en_gb'                            -- Enable English spell check
vim.opt.spellsuggest = { 'best', '20' }                -- Don't show too many suggestions for spell check
vim.opt.spellcapcheck =
''                                                     -- Don't check for end of sentence and capitalization, it doesn't work well with abbreviations
vim.opt.spellfile = vim.fn.expand('~/Drive/vim/spell/en.utf-8.add')
vim.opt.dictionary:append('/usr/share/dict/words')     -- Auto complete words from system dictionary
vim.opt.tags:prepend('./.git/tags')                    -- Read tags from git directory
vim.opt.foldenable = false                             -- Do not fold by default
vim.opt.shortmess:remove('S')                          -- Show total and number of current result after a search
vim.opt.hidden = true                                  -- Allow closing buffers with unsaved changes
vim.opt.mouse = 'a'                                    -- Enable mouse support in all modes
vim.opt.termguicolors = true                           -- Enable truecolor (24 bit)
vim.opt.visualbell = true                              -- Visual flash instead of beeping
vim.opt.errorbells = false                             -- No flash on errors, only at beginning/end of file
vim.opt.laststatus = 2                                 -- Always show status bar
vim.opt.list = true                                    -- Show extra whitespace
vim.opt.previewheight = 20                             -- Make preview bigger
vim.opt.grepprg = 'rg --vimgrep --hidden --smart-case' -- Use ripgrep, much faster than regular grep
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'            -- Use ripgrep's format
vim.g.vimsyn_embed = 1                                 -- Highlight lua and other languages inside vim files
vim.opt.listchars = { tab = "▸ ", trail = "·" }     -- Symbols for invisible characters
vim.cmd [[ let &showbreak='↳ ' ]]                    -- Indicator for wrapped lines
vim.opt.diffopt = {
  'filler',                                            -- Show filler lines to keep diffs aligned
  'internal',                                          -- Use vim's internal diff library
  'indent-heuristic',                                  -- Use vim's internal diff library for indentation
  'algorithm:histogram'                                -- Histogram is better at highlighting line changes
}
vim.opt.completeopt = {
  'menu',    -- Show popup menu for completion
  'menuone', -- Show popup menu even if there is only one result
}
vim.opt.complete = {
  '.', -- Complete with words from current buffer
  'b', -- Complete with words from other loaded buffers
}
-- }}}
-- Custom text object {{{

-- entire buffer
map { 'o', 'ae', ':<c-u>normal! ggVG<cr>' }

-- next parenthesis, brackets, quotes, etc. in current line
map { 'o', 'inb', ':<c-u>normal! f(vi(<cr>' }
map { 'o', 'in(', ':<c-u>normal! f(vi(<cr>' }
map { 'o', 'in)', ':<c-u>normal! f(vi(<cr>' }
map { 'o', 'inB', ':<c-u>normal! f(vi(<cr>' }
map { 'o', 'in[', ':<c-u>normal! f[vi[<cr>' }
map { 'o', 'in]', ':<c-u>normal! f[vi[<cr>' }
map { 'o', 'in{', ':<c-u>normal! f{vi{<cr>' }
map { 'o', 'in}', ':<c-u>normal! f{vi{<cr>' }
map { 'o', "in'", ":<c-u>normal! f'vi'<cr>" }
map { 'o', 'in"', ':<c-u>normal! f"vi"<cr>' }

-- }}}
-- Path and ignored patterns {{{
vim.opt.path:remove('/usr/include') -- Include folder is added by default, no need for it
vim.opt.path:append({
  -- Generic app and test paths
  'bin/**',
  'lib/**',
  'test/**',
  'script/**',
  'scripts/**',
  -- Rails/ruby
  'app/**',
  'spec/**',
  -- Elixir, including umbrella apps
  'priv/**',
  'apps/*/lib/**',
  'apps/*/test/**',
  'apps/*/config/**',
  'apps/*/scripts/**',
  'apps/*/priv/**',
  -- Phoenix
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
  '*/log/*,*.log',                -- Log files
  '*.eof,*.ttf,*.woff',           -- Font files
  '**/node_modules/**'            -- Node artefacts
})
-- }}}
-- Look & Feel {{{
--   Status line {{{
local status_color = '%#Pmenu#'

local trailing_whitespace = function()
  local space = vim.fn.search([[\s\+$]], 'nwc')
  return space ~= 0 and "%#DiffDelete#TW:" .. space .. status_color or ""
end

function Status_line()
  return table.concat {
    status_color,          -- Color
    ' %f ',                -- Relative file path
    '%m',                  -- Modified flag
    '%r',                  -- Read-only flag
    '%h',                  -- Help flag
    '%w',                  -- Preview flag
    '%=',                  -- Right aling the following...
    trailing_whitespace(), -- Trailing space indicator
    ' %c %l/%L '           -- Current column, current line and total lines
  }
end

vim.opt.statusline = "%!luaeval('Status_line()')"
--  }}}

vim.cmd 'highlight clear SpellBad'                         -- Remove default spell highlighting
vim.cmd 'highlight SpellBad cterm=underline gui=undercurl' -- Underline spelling errors
vim.cmd 'highlight TabLineSel guifg=bg guibg=fg'           -- Highlight current tab
vim.cmd "match ErrorMsg '\\s\\+$'"                         -- Highlight trailing spaces
-- }}}
-- Mappings {{{
--   Basic mappings {{{
--
vim.cmd [[
  function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<c-n>"
    else
      return "\<tab>"
    endif
  endfunction
]]

map { 'i', '<tab>', '<c-r>=Tab_Or_Complete()<cr>' } -- Indent or trigger default word completion
map { 'i', 'kj', '<esc>' }                          -- Easily exit insert mode
map { 'n', 'Q', '<nop>' }                           -- Don't go inTo Ex mode
map { 'n', '<tab>', '<c-^>' }                       -- Quick toggle between last two buffers
map { 'n', 'j', 'gj' }                              -- Move around using visual lines, useful when wrap is enabled
map { 'n', 'k', 'gk' }
-- }}}
--   Leader mappings {{{

vim.g.mapleader = ' '                                 -- Use <sapce> as leader key
map { 'n', '<leader><space>', ':FzfLua buffers<cr>' } -- Quick buffer switch
map { 'n', '<leader><tab>', ':find ' }                -- Quick file search

-- /,? - Search in project
-- Use -F by default to disable regexp and search for a literal string
map { 'n', '<leader>/', ':silent grep -F ""<left>' }
map { 'n', '<leader>?', ':silent grep -F -g !test ""<left>' }

--  * - Search in file or project
map { 'n', '<leader>8', ':silent grep "<cword>"<cr>' }
map { 'x', '<leader>8', '"zy:silent grep "<c-r>z"<cr>' }
map { 'n', '<leader>*', ':silent grep "<cWORD>"<cr>' }

-- args
map { 'n', '<leader>aa', ':argadd<cr>' }

-- b - Buffers
map { 'n', '<leader>aa', ':argadd<cr>' }
map { 'n', '<leader>bo', ':Bdelete hidden<cr>' }
map { 'n', '<leader>bb', ':FzfLua buffers<cr>' }

-- c - Copy/clear
map { 'n', '<leader>cb', ':let @+=fugitive#head()<cr>:echo "<c-r>+"<cr>' }                           -- Copy git branch
map { 'n', '<leader>ca', 'mzgg"+yG\'z' }                                                             -- Copy all/entire buffer
map { 'n', '<leader>cfn', ':let @+=expand("%:t")<cr>:echo "<c-r>+"<cr>' }                            -- Copy file name  (foo.txt)
map { 'n', '<leader>cfp', ':let @+=expand("%")<cr>:echo "<c-r>+"<cr>' }                              -- Copy relative path  (src/foo.txt)
map { 'n', '<leader>cfP', ':let @+=expand("%:p")<cr>:echo "<c-r>+"<cr>' }                            -- Copy absolute path  (/something/src/foo.txt)
map { 'n', '<leader>cfl', ':let @+=join([expand(\'%\'),  line(".")], \':\')<cr>:echo "<c-r>+"<cr>' } -- Copy relative path with line number
map { 'n', '<leader>cff', ':let @+=expand("%:p:h")<cr>:echo "<c-r>+"<cr>' }                          -- Copy file directory/folder path (src/)
map { 'n', '<leader>cfd', ':let @+=expand("%:p:h")<cr>:echo "<c-r>+"<cr>' }                          -- Copy file directory/folder path (src/)

map { 'n', '<leader>cs', ':nohl<cr>' }

-- d - Duplicate, diff, db
map { 'n', '<leader>dp', 'yap}p' }
map { 'x', '<leader>dl', 'y`>p' }

map { 'n', '<leader>dcp', 'yapgcip}p', noremap = false }
map { 'n', '<leader>dcl', 'yygccp', noremap = false }
map { 'x', '<leader>dcl', 'ygvgc`>p', noremap = false }

map { 'n', '<leader>d<', ':diffget //2<cr>' }
map { 'n', '<leader>d>', ':diffget //3<cr>' }

-- e - Explore/Extract
map { 'n', '<leader>ei', ':Explore<cr>' }
map { 'n', '<leader>es', ':Sex<cr>' }
map { 'n', '<leader>ev', ':Vex<cr>' }

-- f - File/Find
map { 'n', '<leader>fs', ':up<cr>' }
map { 'n', '<leader>fb', ':FzfLua git_branches<cr>' }
map { 'n', '<leader>fF', ':FzfLua files<cr>' }
map { 'n', '<leader>ff', ':FzfLua git_files<cr>' }
map { 'n', '<leader>fg', ':FzfLua git_status<cr>' }
map { 'n', '<leader>fc', ':FzfLua git_status<cr>' }
map { 'n', '<leader>fr', ':FzfLua oldfiles<cr>' }
map { 'n', '<leader>fh', ':FzfLua help_tags<cr>' }
map { 'n', '<leader>fm', ':FzfLua marks<cr>' }
map { 'n', '<leader>ft', ':FzfLua live_grep_native<cr>' }
map { 'n', '<leader>fl', ':FzfLua lsp_document_symbols<cr>' }
map { 'n', '<leader>fL', ':FzfLua lsp_live_workspace_symbols<cr>' }

-- g - Git/Generate
map { 'n', '<leader>gg', ':Git<space>' }
map { 'n', '<leader>gD', ':vertical leftabove Gdiffsplit origin/main<cr>' }
map { 'n', '<leader>gb', ':Git blame<cr>' }
map { 'n', '<leader>gcb', ':Git checkout -b ' }
map { 'n', '<leader>gco', ':Git checkout ' }
map { 'n', '<leader>gd', ':vertical leftabove Gdiffsplit<cr>' }
map { 'n', '<leader>g3', ':vertical leftabove Gdiffsplit!<cr>' }
map { 'n', '<leader>gf', ':GitStatusFiles<cr><c-w>k:redraw!<cr>' }
map { 'n', '<leader>gh', ':GBrowse<cr>' }
map { 'x', '<leader>gh', ':GBrowse<cr>' }
map { 'n', '<leader>gH', ':GBrowse!<cr>' }
map { 'x', '<leader>gH', ':GBrowse!<cr>' }
map { 'n', '<leader>gl', ':vert Git log -n 50<cr>' }
map { 'n', '<leader>gL', ':0Gclog -n 50<cr>' }
map { 'x', '<leader>gl', ':Gclog -n 50<cr>' }
map { 'n', '<leader>grc', ':Git rebase --continue<cr>' }
map { 'n', '<leader>gpr', ':silent! !github pr view --web<cr>' }
map { 'n', '<leader>gr', ':Gread<cr>' }
map { 'n', '<leader>gc', ':Git commit<cr>' }
map { 'n', '<leader>ga', ':Git commit --amend<cr>' }
map { 'n', '<leader>gs', ':Git|wincmd T<cr>' }
map { 'n', '<leader>gw', ':Gwrite<cr>' }
map { 'n', '<leader>g/', ':Git log -S\'\'<left>' }

-- k - Documentation
map { 'n', '<leader>k', ':Dash!<cr>' }

-- q - Quit
map { 'n', '<leader>q', ':q<cr>' }
map { 'n', '<leader>Q', ':qall!<cr>' }

-- m - Mix
map { 'n', '<leader>mf', ':MixFormat<cr>' }

-- n - notes
map { 'n', '<leader>nn', ':execute "edit ".luaeval(\'require("acg").notes_path()\')<cr>' }

--" o - open
map { 'n', '<leader>of', ":! open '%'<cr>" }

--" r - Remove, redraw
map { 'n', '<leader>rd', ':redraw!<cr>' }
map { 'n', '<leader>rw', 'mz:%s/\\s\\+$//g<cr>:w<cr>\'z' }

--" s - Specs
map { 'n', '<leader>sa', ':TestSuite<cr>' }
map { 'n', '<leader>ss', ':TestVisit<cr>' }
map { 'n', '<leader>sf', ':TestFile<cr>' }
map { 'n', '<leader>sc', ':TestNearest<cr>' }
map { 'n', '<leader>sl', ':TestLast<cr>' }

-- S - Show
map { 'n', '<leader>Sf', ':echo @%<cr>' }
map { 'n', '<leader>Sp', ':echo expand(\'%:p\')<cr>' }

-- T - Tabs/tmux
map { 'n', '<leader>tn', ':tabnew<cr>' }
map { 'n', '<leader>tq', ':VimuxCloseRunner<cr>' }
map { 'n', '<leader>to', ':VimuxRunCommand("")<cr>' }
map { 'n', '<leader>tl', ':VimuxRunLastCommand<cr>' }
map { 'n', '<leader>tt', ':VimuxRunCommand("")<left><left>' }
map { 'n', '<leader>t:', 'VimuxRunCommand("")<left><left>' }
-- interrupt twice to auto-confirm
map { 'n', '<leader>tc', ':VimuxInterruptRunner<cr>:VimuxInterruptRunner<cr>' }

-- V - Vimrc
map { 'n', '<leader>Ve', ':edit $MYVIMRC<cr>' }
map { 'n', '<leader>Vs', ':source $MYVIMRC<cr>' }

-- w - Windows/Tabs
map { 'n', '<leader>wo', ':only<cr>' }
map { 'n', '<leader>we', '<c-w>=' }
map { 'n', '<leader>ws', ':sp<cr>' }
map { 'n', '<leader>wt', ':tabedit %<cr>' }
map { 'n', '<leader>wv', ':vsp<cr>' }

--   }}}
--    Non-leader mappings {{{

-- Copilot
vim.cmd [[
  inoremap <silent><script><expr> <C-j> copilot#Accept("")
  let g:copilot_no_tab_map = v:true
]]

-- pane navigation
map { 'n', '<c-h>', '<c-w>h' }
map { 'n', '<c-j>', '<c-w>j' }
map { 'n', '<c-k>', '<c-w>k' }
map { 'n', '<c-l>', '<c-w>l' }

-- Fix closest spelling error
map { 'i', '<c-f>', '<c-g>u<esc>[s1z=`]a<c-g>u' }

-- format whole file and keep position (original map enter ex mode)
map { 'n', 'gQ', 'mzgggqG`z' }

-- Search and replace current visual selection
map { 'x', '<c-r>', '"zy:%s/<c-r>z//g<left><left>' }

-- Open URLs, a-la Netrw
map { 'n', 'gx', ":execute 'silent! !open ' . shellescape(expand('<cfile>'), 1)<cr>" }

-- Use cursors to resize windows
map { 'n', '<left>', ':vertical resize -3<cr>' }
map { 'n', '<right>', ':vertical resize +3<cr>' }
map { 'n', '<down>', ':resize +3<cr>' }
map { 'n', '<up>', ':resize -3<cr>' }

-- Use cursors to move lines in visual mode
map { 'x', '<up>', ':move \'<-2<cr>gv=gv' }
map { 'x', '<down>', ':move \'>+<cr>gv=gv' }

-- and to increase/decrease indentation
map { 'x', '<right>', '>gv' }
map { 'x', '<left>', '<gv' }

-- Easy beginning/end of line
map { 'n', 'H', '^' }
map { 'n', 'L', '$' }
map { 'x', 'H', '^' }
map { 'x', 'L', '$' }

--   }}}
--   Unimpaired style {{{

-- previous/next file in current folder
map { 'n', ']d', ":<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(v:count1), ':.'))<cr><cr>" }
map { 'n', '[d', ":<c-u>edit <c-r>=Fnameescape(fnamemodify(FileByOffset(-v:count1), ':.'))<cr><cr>" }

map { 'n', ']a', ':next<cr>' }
map { 'n', '[a', ':previous<cr>' }

map { 'n', '[b', ':bprevious<cr>' }
map { 'n', ']b', ':bnext<cr>' }

map { 'n', '[q', ':cprevious<cr>' }
map { 'n', ']q', ':cnext<cr>' }

map { 'n', '[Q', ':colder<cr>' }
map { 'n', ']Q', ':cnewer<cr>' }

map { 'n', '[l', ':lprevious<cr>' }
map { 'n', ']l', ':lnext<cr>' }

map { 'n', '[w', ':tabprevious<cr>' }
map { 'n', ']w', ':tabnext<cr>' }

map { 'n', '[t', ':pop<cr>' }
map { 'n', ']t', ':tag<cr>' }

-- Add new line above/bellow current one
map { 'n', '[<space>', ':call append(line(".") -1, "")<cr>' }
map { 'n', ']<space>', ':call append(line("."), "")<cr>' }

map { 'n', 'coC', ':setlocal cursorcolumn! cursorcolumn?<cr>' }
map { 'n', 'coc', ':setlocal cursorline! cursorline?<cr>' }
map { 'n', 'cof', ':setlocal foldenable! foldenable?<cr>' }
map { 'n', 'coh', ':setlocal hlsearch! hlsearch?<cr>' }
map { 'n', 'col', ':call ToggleLocation()<cr>' }
map { 'n', 'com', ':call ToggleExUnit()<cr>' }
map { 'n', 'con', ':setlocal number! number?<cr>' }
map { 'n', 'cop', ':setlocal paste! paste?<cr>' }
map { 'n', 'coq', ':call ToggleQuickFix()<cr>' }
map { 'n', 'cos', ':setlocal spell! spell?<cr>' }
map { 'n', 'cot', ':call ToggleVimuxTarget()<cr>' }
map { 'n', 'cow', ':setlocal wrap! wrap?<cr>' }

map { 'n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<cr>' }
map { 'n', ']e', '<cmd>lua vim.diagnostic.goto_next()<cr>' }
map { 'n', "coe", '<cmd>lua vim.diagnostic.setqflist({open = true})<cr>' }

-- Previous/next file (based on jumplist)
map { 'n', ']f', ":lua require('bufjump').forward()<cr>" }
map { 'n', '[f', ":lua require('bufjump').backward()<cr>" }

--   }}}
--   Operators {{{

-- web search operator
map { 'n', 'gs', ':set opfunc=WebSearch<cr>g@' }
map { 'x', 'gs', ':<c-u>call WebSearch(visualmode(), 1)<cr>' }

-- copy to system clipboard
map { 'n', 'cP', 'V"+y' }
map { 'n', 'cp', '"+y' }
map { 'x', 'cp', '"+y' }

-- send text to tmux operator
map { 'n', 'gt', ':set opfunc=SendTextToTmux<cr>g@' }
map { 'n', 'gtt', 'V:<c-u>call SendTextToTmux(visualmode(), 1)<cr>' }
map { 'x', 'gt', ':<c-u>call SendTextToTmux(visualmode(), 1)<cr>' }

--   }}}
-- }}}
-- LSP {{{

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Skip buffers with special URI, e.g. fugitive://...
  if vim.api.nvim_buf_get_name(bufnr):match "^%a+://" then
    return
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map { 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>' }
  map { 'n', 'gR', '<cmd>lua vim.lsp.buf.references()<cr>' }
end

-- Display borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Enable the following language servers. They will automatically be installed.
local servers = {
  elixirls = {
    filetypes = { 'elixir', 'eelixir' },
    -- root_dir = require('lspconfig/util').root_pattern(".git");
    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        -- fetchDeps = false
      }
    },
  },
  -- efm-langserver runs credo
  -- see: efm-langserver/.config/efm-langserver/config.yaml
  efm = {
    filetypes = { 'elixir', 'eelixir' },
  },
  -- disable due to large mem consumtption
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          -- Don't bother with external library support
          -- see: https://github.com/sumneko/lua-language-server/discussions/1688
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
  },
  awk_ls = {},
  vimls = {},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = vim.tbl_keys(servers),
}

require('mason-lspconfig').setup_handlers {
  function(server_name)
    servers[server_name].on_attach = on_attach
    require('lspconfig')[server_name].setup(servers[server_name])
  end,
}
-- }}}
-- {{{ CMP
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- }}}
-- Autocommands {{{
acg.augroup("forced_file_types", {
  { 'BufRead,BufNewFile', '*.jbuilder', 'setfiletype ruby' },
  { 'BufRead,BufNewFile', '*.prawn',    'setfiletype ruby' },
  { 'BufRead,BufNewFile', '*.tmux',     'setfiletype tmux' },
  { 'BufRead,BufNewFile', '*tmux/*',    'setfiletype tmux' },
  { 'BufRead,BufNewFile', '*.cfg',      'setfiletype puppet' },
  { 'BufRead,BufNewFile', 'init.el',    'setfiletype lisp' },
  { 'BufRead,BufNewFile', '.spacemacs', 'setfiletype lisp' },
  { 'BufRead,BufNewFile', '*.hocon',    'setfiletype yaml' },
  { 'BufRead,BufNewFile', '*.md',       'setfiletype markdown' },
  { 'BufRead,BufNewFile', '*.trello',   'setfiletype markdown' },
  { 'BufRead,BufNewFile', '*.livemd',   'setfiletype markdown' },
  { 'BufRead,BufNewFile', '*.vader',    'setfiletype vim' },
  { 'BufRead,BufNewFile', '*.heex',     'setfiletype eelixir' },
})

acg.augroup("file_type_templates", {
  { 'BufNewFile', 'Makefile', '0read ~/.config/nvim/ft_templates/Makefile' },
  { 'BufNewFile', '*.awk',    '0read ~/.config/nvim/ft_templates/command.awk' }
})

acg.augroup('quickfix_window', {
  { 'QuickFixCmdPost', 'grep cwindow | redraw!' }, -- Open quickfix window after using grep
  { 'QuickFixCmdPost', 'lgrep redraw!' },          -- Open location window after using grep
  { 'FileType',        'qf wincmd J' },            -- Quickfix window should always be full width
})

acg.augroup('help_window', {
  { 'FileType', 'help', 'wincmd L' }, -- Open help always on the right
})

acg.augroup('commit_window', {
  { 'FileType', 'gitcommit', 'wincmd L' }, -- Open commit always on the right
})

acg.augroup('branch_notes', {
  { 'Bufread,BufNewFile', '*/.git/notes-*', 'set ft=markdown' }, -- Own notes are all markdown
})

acg.augroup('detect_theme_changes', {
  { -- Auto switch theme when MacOs does
    'VimEnter,FocusGained,FocusLost',
    '*',
    'lua require("acg").auto_set_theme()'
  },
})

acg.augroup('lsp_auto_formatting', {
  { -- Auto format files that support it via LSP
    'BufWritePre',
    '*.lua,*.awk',
    'lua vim.lsp.buf.formatting_sync()'
  },
})

-- Automatically create directories when writting files
vim.cmd [[
  au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
]]

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

LSP logs are available in ~/.local/state/nvim/lsp.log

--]]
-- }}}
