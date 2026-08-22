-- vim: foldmethod=marker foldlevel=0 foldenable

local acg = require('acg') -- Utility functions
local map = vim.keymap.set

-- {{{ Plugins

-- Do not draw indent lines
vim.g.miniindentscope_disable = true

-- Has to be set before vim-closetag loads
vim.g.closetag_filetypes = 'html,xhtml,erb,eelixir,heex'

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add(vim.tbl_map(gh, {
  -- Utility collection
  'echasnovski/mini.nvim',

  -- Navigate through files in the jumplist
  'kwkarlwang/bufjump.nvim',

  -- provides :bdelete <type> to easily delete buffers
  'asheq/close-buffers.vim',

  -- custom text object support
  'kana/vim-textobj-user',

  -- Clear search highlight automatically
  'romainl/vim-cool',

  -- Basic unix shell command helpers (mv, rm, etc.)
  'tpope/vim-eunuch',

  -- Readline style shortcuts on insert and command line modes
  'tpope/vim-rsi',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Manage surround pairs (cs, ds, yss, etc.)
  'tpope/vim-surround',
  'tpope/vim-repeat', -- makes surround (and others) repeatable with `.`

  -- File manager
  'stevearc/oil.nvim',

  -- Contrast based themes
  'mcchrish/zenbones.nvim',
  'rktjmp/lush.nvim', -- colorscheme toolkit zenbones is built on

  -- plantuml support
  'aklt/plantuml-syntax',

  -- segments of camelcase, snake_case and similar <av>, <iv>
  'julian/vim-textobj-variable-segment',

  -- mdx (markdown + jsx) support
  'jxnblk/vim-mdx-js',

  -- coffeescript support
  'kchmck/vim-coffee-script',

  -- typescript support
  'leafgarland/typescript-vim',

  -- jsx syntax
  'maxmellon/vim-jsx-pretty',

  -- improved javascript syntax
  'pangloss/vim-javascript',

  -- Bundler support, used to get the current bundled gems on `path`
  'tpope/vim-bundler',

  -- Git integration
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- :GBrowse support for github

  -- Rbenv support, used to get the current ruby version on `path`
  'tpope/vim-rbenv',

  -- SQL Language server
  'nanotee/sqls.nvim',

  -- Git signs and chunk navigation
  'lewis6991/gitsigns.nvim',

  -- Elixir support
  'elixir-editors/vim-elixir',

  -- Auto close html/xml tags
  'alvan/vim-closetag',

  -- Projections for project file navigation
  'tpope/vim-projectionist',

  -- Tmux integration
  'benmills/vimux',

  -- Generic test runner
  'janko-m/vim-test',

  -- Auto save & restore sessions (per folder, per branch, etc.)
  'rmagatti/auto-session',

  -- Goodies and automation for bulleted lists (mostly for markdown)
  'bullets-vim/bullets.vim',
}))

-- }}}
-- Plugin settings {{{

-- Utility collection
do
  -- Split/join lists of arguments, key/value pairs, etc.
  require('mini.splitjoin').setup()

  -- Exchange (gx), evaluate (g=), multiply (gm), replace with register (gr), sort (gs)
  require('mini.operators').setup()

  -- Auto close pairs
  require('mini.pairs').setup()

  -- Align text (ga)
  require('mini.align').setup()

  -- Comment text (gc)
  require('mini.comment').setup({
    mappings = {
      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      -- Works also in Visual mode if mapping differs from `comment_visual`
      textobject = 'ac',
    }
  })

  -- Indentation based scope and navigation
  require('mini.indentscope').setup()

  -- Unimpaired style maps
  require('mini.bracketed').setup({
    conflict   = { suffix = 'x' },
    diagnostic = { suffix = 'e' },
    file       = { suffix = 'd' },
    location   = { suffix = 'l' },
    quickfix   = { suffix = 'q' },
    window     = { suffix = 'w' },

    -- disabled
    treesitter = { suffix = '' },
    comment    = { suffix = '' },
    indent     = { suffix = '' },
    jump       = { suffix = '' },
    oldfile    = { suffix = '' },
    undo       = { suffix = '' },
    yank       = { suffix = '' },
    buffer     = { suffix = '' },
  })
end

-- File manager
require('oil').setup({
  -- Skip the confirmation popup for simple operations
  skip_confirm_for_simple_edits = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
  -- Default maps clash with pane navigation
  use_default_keymaps = false,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-s>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["-"] = "actions.parent",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
  },
})

-- Git signs and chunk navigation
require('gitsigns').setup()

-- Projections for project file navigation
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

-- Tmux integration
vim.g['VimuxRunnerType'] = 'pane' -- Use a pane
vim.g['VimuxOrientation'] = 'v'   -- On the bottom half of the window

-- Generic test runner
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
  file = '--seed 0',                                         -- For single files, run in original order
  nearest = '--trace'                                        -- For single tests, run in verbose mode
}
vim.g['test#javascript#runner'] = 'yarn test'
vim.g['test#javascript#mocha#file_pattern'] = '\\v.*\\.spec\\.(ts|tsx)$'
vim.cmd( -- Custom strategy to avoid echoing the command to the terminal before running it
  [[
    function! CustomVimuxStrategy(cmd)
    call VimuxRunCommand(a:cmd)
    endfunction
    let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
    let g:test#strategy = 'customvimux'
    ]])

-- Auto save & restore sessions (per folder, per branch, etc.)
require('auto-session').setup({
  auto_session_use_git_branch = true,
  auto_restore_enabled = false
})

-- }}}
-- Bundled plugins {{{

-- Vim-ruby
vim.g.ruby_spellcheck_strings = 1    -- Enable spellcheck inside ruby strings
vim.g.ruby_minlines           = 500  -- Avoid syntax errors while scrolling on large files
vim.g.ruby_indent_block_style = 'do' -- Better syntax for nested blocks

-- Diagnostics
vim.diagnostic.config {
  virtual_text = false, -- Don't show virtualtext
  signs = true,         -- But do show signs
  underline = true,     -- And underline over the diagnosed text
}
-- Use lowercase sign indicators
vim.fn.sign_define("DiagnosticSignError", { text = "e", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "w", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "i", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "h", texthl = "DiagnosticSignHint" })

-- vim.lsp.set_log_level('debug')
--  }}}
-- Settings {{{
vim.cmd('packadd cfilter')                             -- Quickfix filter plugin (bundled with vim)
vim.opt.cursorline = true                              -- Highlight cursor line
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
vim.opt.wildmode = { 'noselect:lastused', 'full' }     -- Show the menu without pre-selecting, so typing keeps filtering the results
vim.opt.wildoptions = { 'pum', 'tagfile', 'fuzzy' }    -- Popup menu for completions, matched fuzzily. Does not affect file names, those go through 'findfunc'
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
vim.opt.spellcapcheck = ''                             -- Don't check for end of sentence and capitalization, it doesn't work well with abbreviations
vim.opt.spellfile = vim.fn.expand('~/Drive/vim/spell/en.utf-8.add')
vim.opt.dictionary:append('/usr/share/dict/words')     -- Auto complete words from system dictionary
vim.opt.tags:prepend('./.git/tags')                    -- Read tags from git directory
vim.opt.foldenable = false                             -- Do not fold by default
vim.opt.shortmess:remove('S')                          -- Show total and number of current result after a search
vim.opt.shortmess:prepend('T')                         -- Truncate messages on command line. Helps to avoid "Press ENTER or type command to continue"
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
vim.opt.listchars = { tab = '▸ ', trail = '·' }        -- Symbols for invisible characters
vim.opt.fillchars:append({ diff = '╱' })               -- Hatching instead of --- for diff filler
vim.cmd [[ let &showbreak='↳ ' ]]                      -- Indicator for wrapped lines
vim.opt.diffopt = {
  'filler',                                            -- Show filler lines to keep diffs aligned
  'internal',                                          -- Use vim's internal diff library
  'indent-heuristic',                                  -- Use vim's internal diff library for indentation
  'algorithm:histogram',                               -- Histogram is better at highlighting line changes
  'closeoff',                                          -- Leave diff mode when the other diff window closes
  'inline:char',                                       -- Highlight the changed characters within a line
  'linematch:60',                                      -- Realign lines within a hunk so they pair up visually
  'vertical'                                           -- Always split diffs side by side
}
vim.o.autocomplete = true                              -- Show completion popup while typing (:h ins-autocompletion)
vim.opt.completeopt = {
  'menu',      -- Show popup menu for completion
  'menuone',   -- Show popup menu even if there is only one result
  'popup',     -- Show additional information
  'preinsert', -- Ghost text for the first (pre-selected) result, so <tab> accepts it
}
-- Buffers with an LSP attached use 'omnifunc' instead, see the LspAttach autocmd
vim.opt.complete = {
  '.^5', -- Complete with words from current buffer, at most 5
  'b^5', -- Complete with words from other loaded buffers, at most 5
}

vim.lsp.config('expert', {
  cmd = { 'expert', '--stdio' },
  root_markers = { 'mix.exs', '.git' },
  filetypes = { 'elixir', 'eelixir', 'heex' },
})

vim.lsp.enable('expert')

-- }}}
-- Custom text object {{{

-- entire buffer
map('o', 'ae', ':<c-u>normal! ggVG<cr>')

-- next parenthesis, brackets, quotes, etc. in current line
map('o', 'inb', ':<c-u>normal! f(vi(<cr>')
map('o', 'in(', ':<c-u>normal! f(vi(<cr>')
map('o', 'in)', ':<c-u>normal! f(vi(<cr>')
map('o', 'inB', ':<c-u>normal! f(vi(<cr>')
map('o', 'in[', ':<c-u>normal! f[vi[<cr>')
map('o', 'in]', ':<c-u>normal! f[vi[<cr>')
map('o', 'in{', ':<c-u>normal! f{vi{<cr>')
map('o', 'in}', ':<c-u>normal! f{vi{<cr>')
map('o', "in'", ":<c-u>normal! f'vi'<cr>")
map('o', 'in"', ':<c-u>normal! f"vi"<cr>')

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
  '**/node_modules/**',           -- Node artefacts
  '.yarn/**'                      -- Yarn modules
})
-- }}}
-- Fuzzy find {{{
require('fuzzy_find') -- Fuzzy pickers for files, buffers, symbols and grep
-- }}}
-- Look & Feel {{{
--   Status line {{{
-- local status_color = '%#StatusLine#'

function Status_line()
  return table.concat {
    ' %f ',                -- Relative file path
    '%m',                  -- Modified flag
    '%r',                  -- Read-only flag
    '%h',                  -- Help flag
    '%w',                  -- Preview flag
    '%=',                  -- Right aling the following...
    ' %c %l/%L '           -- Current column, current line and total lines
  }
end

vim.opt.statusline = "%!luaeval('Status_line()')"
--  }}}

-- 'background' is detected from the terminal, see :help 'background'
vim.cmd('colorscheme zenbones')

vim.cmd 'highlight clear SpellBad'                         -- Remove default spell highlighting
vim.cmd 'highlight SpellBad cterm=underline gui=undercurl' -- Underline spelling errors
vim.cmd 'highlight TabLineSel guifg=bg guibg=fg'           -- Highlight current tab
vim.cmd "match ErrorMsg '\\s\\+$'"                         -- Highlight trailing spaces
-- }}}
-- Mappings {{{

--   Basic mappings {{{
--
map('i', 'kj', '<esc>')                          -- Easily exit insert mode
map('n', 'Q', '<nop>')                           -- Don't go inTo Ex mode
map('n', '<tab>', '<c-^>')                       -- Quick toggle between last two buffers
map('n', 'j', 'gj')                              -- Move around using visual lines, useful when wrap is enabled
map('n', 'k', 'gk')
map('i', '<M-Right>', '<c-o>w')                  -- Move between words with Alt-<arrow> like in most apps
map('i', '<M-Left>', '<c-o>b')

-- Completion: accept the pre-selected result, otherwise indent as usual
map('i', '<tab>', function()
  return vim.fn.pumvisible() == 1 and '<c-y>' or '<tab>'
end, { expr = true, desc = 'Accept completion / indent' })

-- Walk back through the results in insert mode (<c-n> walks forward)
map('i', '<s-tab>', function()
  return vim.fn.pumvisible() == 1 and '<c-p>' or '<s-tab>'
end, { expr = true, desc = 'Previous completion result' })

-- Results are reversed, so walk backwards to start from the best match
map('c', '<tab>', function()
  return vim.fn.wildmenumode() == 1 and '<c-p>' or '<tab>'
end, { expr = true, desc = 'Previous completion result' })

map('c', '<s-tab>', function()
  return vim.fn.wildmenumode() == 1 and '<c-n>' or '<s-tab>'
end, { expr = true, desc = 'Next completion result' })

-- Same swap for <c-n>/<c-p>, which otherwise start from the top of the popup.
-- Without the menu they still recall command line history, see :help c_CTRL-N
map('c', '<c-n>', function()
  return vim.fn.wildmenumode() == 1 and '<c-p>' or '<c-n>'
end, { expr = true, desc = 'Previous completion result' })

map('c', '<c-p>', function()
  return vim.fn.wildmenumode() == 1 and '<c-n>' or '<c-p>'
end, { expr = true, desc = 'Next completion result' })

-- The command line popup steals <Up>/<Down>, dismiss it to walk the history
map('c', '<Up>', function()
  return vim.fn.wildmenumode() == 1 and '<c-e><Up>' or '<Up>'
end, { expr = true, desc = 'Previous command in history' })

map('c', '<Down>', function()
  return vim.fn.wildmenumode() == 1 and '<c-e><Down>' or '<Down>'
end, { expr = true, desc = 'Next command in history' })

-- }}}
--   Leader mappings {{{

vim.g.mapleader = ' '                              -- Use <sapce> as leader key

map('n', '<leader>.', ':find ')                    -- Quick find
map('n', '<leader><space>', ':Buffer ')            -- Quick buffer switch (fuzzy)
map('n', '<leader>;', ':')                         -- Run vim commands

-- /,? - Search in project
-- Use -F by default to disable regexp and search for a literal string
map('n', '<leader>/', ':silent grep -F ""<left>')
map('n', '<leader>?', ':silent grep -F -g !test ""<left>')

--  * - Search in file or project
map('n', '<leader>8', ':silent grep "<cword>"<cr>')
map('x', '<leader>8', '"zy:silent grep "<c-r>z"<cr>')
map('n', '<leader>*', ':silent grep "<cWORD>"<cr>')

-- args
map('n', '<leader>aa', function()
  vim.cmd("argadd %")
  vim.cmd("argdedup")
end)

-- b - Buffers
map('n', '<leader>bo', ':Bdelete hidden<cr>')
map('n', '<leader>bb', ':Buffer ')

-- c - Copy/clear
map('n', '<leader>cb', ':let @+=FugitiveHead()<cr>:echo "<c-r>+"<cr>')                             -- Copy git branch
map('n', '<leader>cfn', ':let @+=expand("%:t")<cr>:echo "<c-r>+"<cr>' )                            -- Copy file name  (foo.txt)
map('n', '<leader>cfp', ':let @+=expand("%")<cr>:echo "<c-r>+"<cr>' )                              -- Copy relative path  (src/foo.txt)
map('n', '<leader>cfP', ':let @+=expand("%:p")<cr>:echo "<c-r>+"<cr>' )                            -- Copy absolute path  (/something/src/foo.txt)
map('n', '<leader>cfl', ':let @+=join([expand(\'%\'),  line(".")], \':\')<cr>:echo "<c-r>+"<cr>' ) -- Copy relative path with line number
map('n', '<leader>cff', ':let @+=expand("%:p:h")<cr>:echo "<c-r>+"<cr>' )                          -- Copy file directory/folder path (src/)
map('n', '<leader>cfd', ':let @+=expand("%:p:h")<cr>:echo "<c-r>+"<cr>' )                          -- Copy file directory/folder path (src/)

-- d - Duplicate, diff, db
map('n', '<leader>dp', 'yap}p')
map('n', '<leader>dl', 'yygccp', {remap = true})

map('n',   '<leader>dcp', 'yapgcip}p', {remap = true})
map('n', '<leader>dcl', 'yygccp', {remap = true})
map('x', '<leader>dcl', 'ygvgc`>p', {remap = true})

map('n', '<leader>d<', ':diffget //2<cr>')
map('n', '<leader>d>', ':diffget //3<cr>')

-- e - Explore/Extract
map('n', '<leader>ei', ':Explore<cr>')
map('n', '<leader>es', ':Sex<cr>')
map('n', '<leader>ev', ':Vex<cr>')

-- f - File/format
map('n', '<leader>fs', ':up<cr>')
map('n', '<leader>fb', ':Branch ')
map('n', '<leader>fF', ':FindAll ')
map('n', '<leader>ff', ':find ')
map('n', '<leader>fg', ':Modified ')
map('n', '<leader>fr', ':Oldfiles ')
map('n', '<leader>fh', ':help ')
map('n', '<leader>fn', ':Notes ')
map('n', '<leader>ft', ':Grep ')
map('n', '<leader>fl', ':Symbol ')
map('n', '<leader>fm', ':marks<cr>')

-- Format json shortcut, since it's used often
map('n', '<leader>fj', ':set ft = json<bar>%!jq<cr>')
map('n', '<leader>fx', ':set ft = xml<bar>%!xmllint --format --recover --nowarning<cr>')

-- g - Git/Generate
map('n', '<leader>gg', ':Git<space>')
map('n', '<leader>gD', ':vertical leftabove Gdiffsplit origin/main<cr>')
map('n', '<leader>gb', ':Git blame<cr>')
map('n', '<leader>gcb', ':Git checkout -b ')
map('n', '<leader>gco', ':Git checkout ')
map('n', '<leader>gd', ':vertical leftabove Gdiffsplit<cr>')
map('n', '<leader>g3', ':vertical leftabove Gdiffsplit!<cr>')
map('n', '<leader>gf', acg.quickfix_git_changed)
map('n', '<leader>gh', ':GBrowse<cr>')
map('x', '<leader>gh', ':GBrowse<cr>')
map('n', '<leader>gH', ':GBrowse!<cr>')
map('x', '<leader>gH', ':GBrowse!<cr>')
map('n', '<leader>gl', ':vert Git log -n 50<cr>')
map('n', '<leader>gL', ':0Gclog -n 50<cr>')
map('x', '<leader>gl', ':Gclog -n 50<cr>')
map('n', '<leader>grc', ':Git rebase --continue<cr>')
map('n', '<leader>gpr', ':silent !gh pr view --web<cr>')
map('n', '<leader>gr', ':Gread<cr>')
map('n', '<leader>gc', ':Git commit<cr>')
map('n', '<leader>ga', ':Git commit --amend<cr>')
map('n', '<leader>gu', ':Git commit --amend --no-edit<cr>')
map('n', '<leader>gs', ':Git|wincmd T<cr>')
-- ^! is "this commit vs its parent"; the ! needs escaping and the cursor is
-- parked just before it, so <leader>gt HEAD gives :Git difftool -y HEAD^\!
map('n', '<leader>gt', ':Git difftool -y ^\\!<left><left><left>') -- every file in a commit, one tab each
map('n', '<leader>gT', ':Git difftool ^\\!<left><left><left>')    -- every hunk in a commit, into quickfix
map('n', '<leader>gv', ':vertical leftabove Gvdiffsplit ')        -- current file against a revision
map('n', '<leader>gw', ':Gwrite<cr>')
map('n', '<leader>g/', ':Git log -S\'\'<left>')

-- k - Documentation
map('n', '<leader>k', ':silent !open dash://<cword><cr>')
map('x', '<leader>k', '"zy:silent !open dash://<c-r>z<cr>')

-- q - Quit
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>Q', ':qall!<cr>')

-- m - Mix
map('n', '<leader>mf', ':!mix format %<cr>')

-- n - notes
map('n', '<leader>nn', ':execute "edit ".luaeval(\'require("acg").notes_path()\')<cr>' )

--" o - open
map('n', '<leader>of', ":! open '%'<cr>")

--" p - paste
map('n', '<leader>p', ':registers<cr>')

--" r - Remove, redraw
map('n', '<leader>rd', ':redraw!<cr>')
map('n', '<leader>rw', 'mz:%s/\\s\\+$//g<cr>:w<cr>\'z')

--" s - Specs
map('n', '<leader>sa', ':TestSuite<cr>')
map('n', '<leader>ss', ':TestVisit<cr>')
map('n', '<leader>sf', ':TestFile<cr>')
map('n', '<leader>sc', ':TestNearest<cr>')
map('n', '<leader>sl', ':TestLast<cr>')

-- S - Show
map('n', '<leader>Sf', ':echo @%<cr>')
map('n', '<leader>Sp',   ':echo expand(\'%:p\')<cr>' )

-- T - Tabs/tmux/transform
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>tq', ':VimuxCloseRunner<cr>')
map('n', '<leader>to', ':VimuxRunCommand("")<cr>' )
map('n', '<leader>tl', ':VimuxRunCommand("!!")<cr>')
map('n', '<leader>tt', ':VimuxRunCommand("")<left><left>' )
map('n', '<leader>t:', 'VimuxRunCommand("")<left><left>' )
map('n', '<leader>tw', ':VimuxClearTerminalScreen<CR>' )
-- interrupt twice to auto-confirm
map('n', '<leader>tc', ':VimuxInterruptRunner<cr>:VimuxInterruptRunner<cr>')


vim.cmd [[
" Transform a rocket map pair into a colon one
"    before: {"something" => 1}
"    after:  {something: 1}
nnoremap <silent> <Plug>RocketToColon /=><cr>daWF"r:F"x
\ :call repeat#set("\<Plug>RocketToColon", v:count)<cr>
nmap <leader>t:  <Plug>RocketToColon

" Transform a colon map pair into a rocket one
"    before: {something: 1}
"    after:  {"something" => 1}
nnoremap <silent> <Plug>ColonToRocket f:r"bi"<esc>f a=> <esc>
\ :call repeat#set("\<Plug>ColonToRocket", v:count)<cr>
nmap <leader>t>  <Plug>ColonToRocket
]]


-- V - Vimrc
map('n', '<leader>Ve', ':edit $MYVIMRC<cr>')
map('n', '<leader>Vs', ':source $MYVIMRC<cr>')

-- w - Windows/Tabs
map('n', '<leader>wO', ':tabonly<cr>')
map('n', '<leader>wo', ':only<cr>')
map('n', '<leader>we', '<c-w>=')
map('n', '<leader>ws', ':sp<cr>')
map('n', '<leader>wt', ':tabedit %<cr>')
map('n', '<leader>wv', ':vsp<cr>')

--   }}}
--    Non-leader mappings {{{

-- Unimpaired style tab navigation
map('n', '[w', ':tabprevious<cr>')
map('n', ']w', ':tabnext<cr>')

-- Unimpaired style quickfix navigation
map('n', '[q', ':cprevious<cr>')
map('n', ']q', ':cnext<cr>')

-- Unimpaired style quickfix history navigation
map('n', '[Q', ':colder<cr>')
map('n', ']Q', ':cnewer<cr>')

-- Unimpaired style arg navigation
map('n', '[a', ':next<cr>')
map('n', ']a', ':previous<cr>')

-- Unimpaired style jumplist file navigation
map('n', ']f', function() require('bufjump').forward() end)
map('n', '[f', function() require('bufjump').backward() end)

-- Unimpaired style git hunk navigation. In a diff `]c`/`[c` already walk the
-- changes, so fall through to the built-in there
map('n', ']c', function()
  if vim.wo.diff then return ']c' end
  vim.schedule(function() require('gitsigns').nav_hunk('next') end)
  return '<Ignore>'
end, { expr = true })

map('n', '[c', function()
  if vim.wo.diff then return '[c' end
  vim.schedule(function() require('gitsigns').nav_hunk('prev') end)
  return '<Ignore>'
end, { expr = true })

-- File manager
map('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })

-- Navigate to previous header (from treesitter-context)
-- vim.keymap.set("n", "[h", function()
--   require("treesitter-context").go_to_context(vim.v.count1)
-- end, { silent = true })

-- pane navigation
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- format whole file and keep position (original map enter ex mode)
map('n', 'gQ', 'mzgggqG`z')

-- Search and replace current visual selection
map('x', '<c-r>', '"zy:%s/<c-r>z//g<left><left>')

-- Use cursors to resize windows
map('n', '<left>', ':vertical resize -3<cr>')
map('n', '<right>', ':vertical resize +3<cr>')
map('n', '<down>', ':resize +3<cr>')
map('n', '<up>', ':resize -3<cr>')

-- Use cursors to move lines in visual mode
map('x', '<up>', ':move \'<-2<cr>gv=gv')
map('x', '<down>', ':move \'>+<cr>gv=gv')

-- and to increase/decrease indentation
map('x', '<right>', '>gv')
map('x', '<left>', '<gv')

-- Easy beginning/end of line
map('n', 'H', '^')
map('n', 'L', '$')
map('x', 'H', '^')
map('x', 'L', '$')

-- This is to overwrite copy entire buffer, so that it keeps cursor position
map('n', 'cpae', 'mzgg"+yG\'z')                                                              -- Copy all/entire buffer

-- Format the whole buffer, keeping cursor position
map('n', 'fff', 'mzgg=G\'z')

--   }}}

-- Add new line above/bellow current one
map('n', '[<space>', ':call append(line(".") -1, "")<cr>' )
map('n', ']<space>', ':call append(line("."), "")<cr>' )

map('n', 'coC', ':setlocal cursorcolumn! cursorcolumn?<cr>')
map('n', 'coT', ':call ToggleVimuxTarget()<cr>' )
map('n', 'coc', ':setlocal cursorline! cursorline?<cr>')
map('n', 'cof', ':setlocal foldenable! foldenable?<cr>')
map('n', 'coh', ':setlocal hlsearch! hlsearch?<cr>')
map('n', 'col', ':call ToggleLocation()<cr>' )
map('n', 'con', ':setlocal number! number?<cr>')
map('n', 'cop', ':setlocal paste! paste?<cr>')
map('n', 'coq', ':call ToggleQuickFix()<cr>' )
map('n', 'cos', ':setlocal spell! spell?<cr>')
map('n', 'cot', ':silent !tmux resize-pane -Z<cr>' )
map('n', 'cow', ':setlocal wrap! wrap?<cr>')

--   }}}
--   Operators {{{

-- web search operator
map('n', 'go', ':set opfunc=WebSearch<cr>g@')
map('x', 'go', ':<c-u>call WebSearch(visualmode(), 1)<cr>')

-- copy to system clipboard
map('n', 'cP', 'V"+y')
map('n', 'cpp', 'V"+y')
map('n', 'cp', '"+y')
map('x', 'cp', '"+y')

-- send text to tmux operator
map('n', 'gt', ':set opfunc=SendTextToTmux<cr>g@')
map('n', 'gtt', 'V:<c-u>call SendTextToTmux(visualmode(), 1)<cr>' )
map('x', 'gt', ':<c-u>call SendTextToTmux(visualmode(), 1)<cr>' )

--   }}}
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
  { 'BufRead,BufNewFile', '*.notes',    'setfiletype markdown' },
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

acg.augroup('diff_folds', {
  -- foldenable is off globally, but in a diff we want unchanged regions collapsed
  { 'OptionSet', 'diff', 'let &l:foldenable = v:option_new' },
})

acg.augroup('branch_notes', {
  { 'Bufread,BufNewFile', '*/.git/notes-*', 'set ft=markdown' }, -- Own notes are all markdown
})

acg.augroup('lsp_format_on_save', {
  {
    'BufWritePre',
    '*.ex,*.exs,*.heex',
    'lua vim.lsp.buf.format({ async = false })'
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Feed LSP items into the completion popup, and apply snippets,
    -- auto-imports, etc. when accepting an item
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)

    -- Complete from the LSP only. Words from buffers arrive before the (async)
    -- LSP results, which would leave them always at the top of the popup.
    -- They are still available on demand with <c-x><c-n>
    vim.bo[ev.buf].complete = 'o'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>ll', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
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

--]]
-- }}}
