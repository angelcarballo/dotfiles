-- vim: foldmethod=marker foldlevel=0 foldenable

local acg = require('acg') -- Utility functions
local map = vim.keymap.set

-- {{{ Lazy Bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- }}}
-- {{{ Plugins

-- This has to be set before the plugin is loaded
vim.g.swap_no_default_key_mappings = true

-- Do not draw indent lines
vim.g.miniindentscope_disable = true

require('lazy').setup({
  -- Utility collection
  { 'echasnovski/mini.nvim', version = false, config = function()
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
      comment    = { suffix = 'c' },
      conflict   = { suffix = 'x' },
      diagnostic = { suffix = 'e' },
      file       = { suffix = 'd' },
      location   = { suffix = 'l' },
      quickfix   = { suffix = 'q' },
      treesitter = { suffix = 't' },

      -- disabled
      indent     = { suffix = '' },
      jump       = { suffix = '' },
      oldfile    = { suffix = '' },
      undo       = { suffix = '' },
      yank       = { suffix = '' },
      window     = { suffix = '' },
      buffer     = { suffix = '' },
    })
  end},

  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")

      require('telescope').setup({
        defaults = {
          preview = { hide_on_startup = true },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<c-j>"] = action_layout.toggle_preview,
              ["<C-h>"] = "which_key",
              ["<c-x>"] = actions.delete_buffer
            },
            n = {
              ["<c-j>"] = action_layout.toggle_preview,
              ["<c-x>"] = actions.delete_buffer
            },
          },
          layout_strategy = "bottom_pane",
          layout_config = {
            bottom_pane = {
              height = 20,
              preview_cutoff = 120,
              prompt_position = "bottom"
            }
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          }
        }
      })
    end
  },

  -- Navigate through files in the jumplist
  {'kwkarlwang/bufjump.nvim', config = function()
    map('n', ']f', ":lua require('bufjump').forward()<cr>" )
    map('n', '[f', ":lua require('bufjump').backward()<cr>" )
  end},

  -- provides :bdelete <type> to easily delete buffers
  'asheq/close-buffers.vim',

  -- Magic!
  'github/copilot.vim',

  -- Support for .editorconfig files
  'gpanders/editorconfig.nvim',

  -- custom text object support
  'kana/vim-textobj-user',

  -- swap delimited items (arguments, map pairs, etc.) (g>, g<)
  {'machakann/vim-swap', config = function()
    map('n', 'g<', '<Plug>(swap-prev)')
    map('n', 'g>', '<Plug>(swap-next)')
  end},

  -- Show info about current function+method (LSP)
  'ray-x/lsp_signature.nvim',

  -- Clear search highlight automatically
  'romainl/vim-cool',

  -- work with word variants (change casing, smart substitute, etc.)
  {'tpope/vim-abolish', lazy = true},

  -- Basic unix shell command helpers (mv, rm, etc.)
  {'tpope/vim-eunuch', lazy = true},

  -- Readline style shortcuts on insert and command line modes
  'tpope/vim-rsi',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Manage surround pairs (cs, ds, yss, etc.)
  {'tpope/vim-surround', dependencies = { 'tpope/vim-repeat' }},

  -- File manager
  { 'stevearc/oil.nvim', config = function()
    require("oil").setup({
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
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
      },
    })
    map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
  end},

  -- Contrast based themes
  {'mcchrish/zenbones.nvim', dependencies = {'rktjmp/lush.nvim'}},

  -- plantuml support
  {'aklt/plantuml-syntax', lazy = true, ft = {'plantuml'}},

  -- segments of camelcase, snake_case and similar <av>, <iv>
  {'julian/vim-textobj-variable-segment', dependencies={'kana/vim-textobj-user'}},

  -- mdx (markdown + jsx) support
  {'jxnblk/vim-mdx-js', lazy = true, ft = {'javascript'}},

  -- coffeescript support
  {'kchmck/vim-coffee-script', lazy = true, ft = {'ruby', 'markdown'}},

  -- typescript support
  {'leafgarland/typescript-vim', lazy = true, ft = {'typescript', 'markdown'}},

  -- jsx syntax
  {'maxmellon/vim-jsx-pretty', lazy = true, ft = {'javascript'}},

  -- improved javascript syntax
  {'pangloss/vim-javascript', lazy = true, ft = {'javascript', 'markdown'}},

  -- Bundler support, used to get the current bundled gems on `path`
  {'tpope/vim-bundler', lazy = true, ft = {'ruby'}},

  -- Git integration
  {'tpope/vim-fugitive', dependencies={'tpope/vim-rhubarb'}},

  -- Rbenv support, used to get the current ruby version on `path`
  {'tpope/vim-rbenv', lazy = true, ft = {'ruby'}},

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'elixir', 'heex', 'eex', 'python', 'ruby',
          'javascript', 'typescript', 'lua', 'vim', 'sql', 'yaml', 'toml',
          'markdown', 'markdown_inline' },

        highlight = { enable = true },
        indent = { enable = true },

        textobjects = {
          select = {
            enable = true,
            lookahead = false, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',

              -- This applies to do/end blocks in Elixir
              ['ik'] = '@block.inner',
              ['ak'] = '@block.outer',
            },
          }
        },
      }
    end
  },
  'nvim-treesitter/nvim-treesitter-textobjects',

  -- Completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/vim-vsnip',
  {'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        }, {
            {
              name = 'buffer',
              option = {
                get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end
              }
            },
          })
      })
    end,
  },

  -- SQL Language server
  'nanotee/sqls.nvim',

  {'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').elixirls.setup{
        cmd = { '/Users/angel/src/elixirls/release/language_server.sh' };
        capabilities = require('cmp_nvim_lsp').default_capabilities();
        settings = {
          elixirLS = {
            dialyzerEnabled = false,
            fetchDeps = true
          }
        }
      }

      require('lspconfig').sqls.setup{
        cmd = {"/Users/angel/.local/share/mise/installs/go/1.23.4/bin/sqls", "-config", "/Users/angel/.config/sqls/config.yml"};
        on_attach = function(client, bufnr)
          require('sqls').on_attach(client, bufnr)
        end
      }
    end},

  -- Git signs and chunk navigation
  {'lewis6991/gitsigns.nvim', config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})
      end
    }
  end},


  -- Elixir support
  {'elixir-editors/vim-elixir', lazy = true, ft = {'elixir', 'heex', 'markdown', 'eelixir'}},

  -- Auto close html/xml tags
  {'alvan/vim-closetag', init = function()
    vim.g.closetag_filetypes = 'html,xhtml,erb,eelixir,heex'
  end},

  -- Projections for project file navigation
  {'tpope/vim-projectionist', config = function()
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
  end},

  -- Tmux integration
  {'benmills/vimux', config = function()
    vim.g['VimuxRunnerType'] = 'pane' -- Use a pane
    vim.g['VimuxOrientation'] = 'v'   -- On the bottom half of the window
  end},

  -- Generic test runner
  {'janko-m/vim-test', config = function()
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
  end},

  -- Auto save & restore sessions (per folder, per branch, etc.)
  {'rmagatti/auto-session', config = function()
    require('auto-session').setup({
      auto_session_use_git_branch = true,
      auto_restore_enabled = false
    })
  end},

  -- Goodies and automation for bulleted lists (mostly for markdown)
  'bullets-vim/bullets.vim',

  {
    "frankroeder/parrot.nvim",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
    config = function()
      require("parrot").setup {
        -- Providers must be explicitly added to make them available.
        providers = {
          anthropic = {
            api_key = os.getenv "ANTHROPIC_API_KEY",
          }
        },
      }
    end,
  }
}, {
    dev = {
      path = '~/src', -- where to find local plugins
    }
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
vim.opt.spellcapcheck = ''                             -- Don't check for end of sentence and capitalization, it doesn't work well with abbreviations
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
vim.opt.listchars = { tab = '▸ ', trail = '·' }        -- Symbols for invisible characters
vim.cmd [[ let &showbreak='↳ ' ]]                      -- Indicator for wrapped lines
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
-- Look & Feel {{{
--   Status line {{{
local status_color = '%#Pmenu#'

local trailing_whitespace = function()
  local space = vim.fn.search([[\s\+$]], 'nwc')
  return space ~= 0 and '%#DiffDelete#TW:' .. space .. status_color or ""
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
require('telescope').load_extension('fzf')
local telescope = require('telescope.builtin')

--   Basic mappings {{{
--
map('i', 'kj', '<esc>')                          -- Easily exit insert mode
map('n', 'Q', '<nop>')                           -- Don't go inTo Ex mode
map('n', '<tab>', '<c-^>')                       -- Quick toggle between last two buffers
map('n', 'j', 'gj')                              -- Move around using visual lines, useful when wrap is enabled
map('n', 'k', 'gk')
map('i', '<M-Right>', '<c-o>w')                  -- Move between words with Alt-<arrow> like in most apps
map('i', '<M-Left>', '<c-o>b')
map('i', '<c-q>', telescope.registers)           -- Paste from register
-- }}}
--   Leader mappings {{{

vim.g.mapleader = ' '                              -- Use <sapce> as leader key

map('n', '<leader>.', ':find ')                    -- Quick find
map('n', '<leader>,', ':b ')                       -- Quick buffer switch
map('n', '<leader><space>', telescope.buffers) -- Quick buffer switch (fuzzy)
map('n', '<leader>;', telescope.commands)      -- Run vim commannds

-- /,? - Search in project
-- Use -F by default to disable regexp and search for a literal string
map('n', '<leader>/', ':silent grep -F ""<left>')
map('n', '<leader>?', ':silent grep -F -g !test ""<left>')

--  * - Search in file or project
map('n', '<leader>8', ':silent grep "<cword>"<cr>')
map('x', '<leader>8', '"zy:silent grep "<c-r>z"<cr>')
map('n', '<leader>*', ':silent grep "<cWORD>"<cr>')

-- args
map('n', '<leader>aa', ':argadd<cr>')

-- b - Buffers
map('n', '<leader>aa', ':argadd<cr>')
map('n', '<leader>bo', ':Bdelete hidden<cr>')
map('n', '<leader>bb', telescope.buffers)

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
map('n', '<leader>fb', telescope.git_branches)
map('n', '<leader>fF', telescope.find_files)
map('n', '<leader>ff', telescope.git_files)
map('n', '<leader>fg', telescope.git_status)
map('n', '<leader>fc', telescope.git_status)
map('n', '<leader>fr', telescope.oldfiles)
map('n', '<leader>fh', telescope.help_tags)
map('n', '<leader>fm', telescope.marks)
map('n', '<leader>fn', function() telescope.find_files({ cwd = vim.fn.expand('$NOTES') }) end)
map('n', '<leader>ft', telescope.live_grep)
map('n', '<leader>fl', telescope.lsp_document_symbols)

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
map('n', '<leader>gf', ':GitStatusFiles<cr><c-w>k:redraw!<cr>')
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
map('n', '<leader>gw', ':Gwrite<cr>')
map('n', '<leader>g/', ':Git log -S\'\'<left>')

-- k - Documentation
map('n', '<leader>k', ':silent !open dash://<cword><cr>')
map('x', '<leader>k', '"zy:silent !open dash://<c-r>z<cr>')

-- q - Quit
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>Q', ':qall!<cr>')

-- m - Mix
map('n', '<leader>mf', ':lua vim.lsp.buf.format()<cr>')

-- n - notes
map('n', '<leader>nn', ':execute "edit ".luaeval(\'require("acg").notes_path()\')<cr>' )

--" o - open
map('n', '<leader>of', ":! open '%'<cr>")

--" p - paste
map('n', '<leader>p', telescope.registers)

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
nmap <Leader>t:  <Plug>RocketToColon

" Transform a colon map pair into a rocket one
"    before: {something: 1}
"    after:  {"something" => 1}
nnoremap <silent> <Plug>ColonToRocket f:r"bi"<esc>f a=> <esc>
\ :call repeat#set("\<Plug>ColonToRocket", v:count)<cr>
nmap <Leader>t>  <Plug>ColonToRocket
]]


-- V - Vimrc
map('n', '<leader>Ve', ':edit $MYVIMRC<cr>')
map('n', '<leader>Vs', ':source $MYVIMRC<cr>')

-- w - Windows/Tabs
map('n', '<leader>wo', ':only<cr>')
map('n', '<leader>we', '<c-w>=')
map('n', '<leader>ws', ':sp<cr>')
map('n', '<leader>wt', ':tabedit %<cr>')
map('n', '<leader>wv', ':vsp<cr>')

--   }}}
--    Non-leader mappings {{{

-- Copilot
vim.cmd [[
  let g:copilot_no_tab_map = v:true
  inoremap <silent><script><expr> <C-j> copilot#Accept("")
]]


-- Unimpaired style tab navigation
map('n', '[w', ':tabprevious<cr>')
map('n', ']w', ':tabnext<cr>')

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
map('n', 'coc', ':setlocal cursorline! cursorline?<cr>')
map('n', 'cof', ':setlocal foldenable! foldenable?<cr>')
map('n', 'coh', ':setlocal hlsearch! hlsearch?<cr>')
map('n', 'col', ':call ToggleLocation()<cr>' )
map('n', 'com', ':call ToggleExUnit()<cr>' )
map('n', 'con', ':setlocal number! number?<cr>')
map('n', 'cop', ':setlocal paste! paste?<cr>')
map('n', 'coq', ':call ToggleQuickFix()<cr>' )
map('n', 'cos', ':setlocal spell! spell?<cr>')
map('n', 'coT', ':call ToggleVimuxTarget()<cr>' )
map('n', 'cot', ':silent !tmux resize-pane -Z<cr>' )
map('n', 'cow', ':setlocal wrap! wrap?<cr>')
map( 'n', "coe", '<cmd>lua vim.diagnostic.setqflist({open = true})<cr>')

-- Inline assist
map('x', 'ga', ':PrtRewrite<cr>')


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
    -- Enable function signature
    require "lsp_signature".on_attach({
      doclines = 0,
      floating_window = false,
      hint_prefix = ''
    }, ev.buf)

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
