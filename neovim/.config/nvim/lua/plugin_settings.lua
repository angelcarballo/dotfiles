-- Plugin: vim-lion
vim.g.lion_squeeze_spaces = 1

-- Plugin: closetag
vim.g.closetag_filetypes = 'html,xhtml,erb,eelixir'

-- Plugin: dispatch
vim.g.dispatch_no_maps = 1

-- Plugin: vimux
-- Send the following to the runner pane before every command:
-- q     : ensure we're not in tmux scroll/copy mode
-- <esc> : ensure we're in readline's normal mode
-- C     : replace whole line
vim.g['VimuxResetSequence'] = 'qC'

-- Default to bottom pane for runner
vim.g['VimuxRunnerType']='pane'
vim.g['VimuxOrientation'] = 'v'

-- Plugin: vim-test
vim.cmd [[
  " Custom strategy to avoid echoing command
  function! CustomVimuxStrategy(cmd)
    call VimuxRunCommand(a:cmd)
  endfunction
  let g:test#custom_strategies = {'customvimux': function('CustomVimuxStrategy')}
  let g:test#strategy = 'customvimux'
]]
vim.g['test#python#runner']  = 'pytest'
vim.g['test#python#pytest#executable']  = 'pipenv run pytest'

vim.g['test#ruby#use_binstubs']  = 1
vim.g['test#ruby#rspec#options']  = {
  nearest = '--fail-fast --order 0 --format documentation',
  file = '--fail-fast --order 0 --format documentation',
  suite = '--fail-fast',
}

vim.g['test#elixir#exunit#options']  = {
  suite = '--stale',
  file = '--trace --seed 0',
  nearest = '--trace'
}

vim.g['g:test#elixir#exunit#executable']  = 'mix test'

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
require('telescope').load_extension('fzf')
require('telescope').setup{
  pickers = {
    lsp_code_actions = { theme = "cursor" }
  },
  defaults = {
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
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

-- Plugin: native LSP
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
}

-- Plugin: gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    -- Text objects
    -- ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    -- ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },
}
