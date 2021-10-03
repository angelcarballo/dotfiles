-- Ensure packer is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Allow packer to manage itself
  use 'wbthomason/packer.nvim'

  -- Basic plugins
  use 'kana/vim-textobj-user'               -- custom text object support
  use 'tpope/vim-repeat'                    -- extend repeat support
  use 'AndrewRadev/splitjoin.vim'           -- split/join statements (gS, gJ)
  use 'tpope/vim-eunuch'                    -- basic unix shell command helpers (mv, rm, etc.)

  -- Git
  use 'tpope/vim-fugitive'                  -- git integration
  use 'tpope/vim-rhubarb'                   -- github integration
  use 'airblade/vim-gitgutter'              -- show git changes on signcolumn

  -- Languages & frameworks
  use 'tpope/vim-rbenv'                     -- Rbenv support, used to get the current ruby version on `path`
  use 'tpope/vim-bundler'                   -- Bundler support, used to get the current bundled gems on `path`
  use 'elixir-editors/vim-elixir'           -- Elixir support
  use 'aklt/plantuml-syntax'                -- PlantUML support
  use 'kchmck/vim-coffee-script'            -- Coffeescript support
  use 'pangloss/vim-javascript'             -- Improved Javascript syntax
  use 'MaxMEllon/vim-jsx-pretty'            -- JSX syntax
  use 'evanleck/vim-svelte'                 -- Svelte syntax
  use 'leafgarland/typescript-vim'          -- Typescript support
  use 'jxnblk/vim-mdx-js'                   -- MDX (markdown + JSX) support

  -- Operators
  use 'tpope/vim-surround'                  -- alter surroundings (), [], '', {}
  use 'tommcdo/vim-exchange'                -- text exchange operator (cx..)
  use 'vim-scripts/ReplaceWithRegister'     -- replace without yanking operator (gr..)
  use 'tpope/vim-commentary'                -- un/comment code (gc)
  use 'tommcdo/vim-lion'                    -- align code

  -- Text objects
  use 'michaeljsmith/vim-indent-object'     -- indentation based text object <ai>, <ii>
  use 'Julian/vim-textobj-variable-segment' -- segments of camelCase, snake_case and similar <av>, <iv>
  use 'glts/vim-textobj-comment'            -- comments text object <ic>, <ac>, <aC> to include whitespace
  use 'nelstrom/vim-textobj-rubyblock'      -- ruby blocks/class/method <ar>, <ir>

  -- Look & Feel
  use 'romainl/vim-cool'                    -- clear search highlight automatically
  use 'lifepillar/vim-solarized8'           -- Solarized variant with some less cruft (but better looking than flattened)
  use 'romainl/Apprentice'                  -- Solarized variant with some less cruft (but better looking than flattened)

  -- Navigation
  -- generic fuzzy finder
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'romainl/vim-devdocs'                 -- search documentation on DevDocs
  use 'ludovicchabant/vim-gutentags'        -- auto generate and update tags
  use 'tpope/vim-projectionist'             -- projections for project file navigation
  use 'Asheq/close-buffers.vim'             -- provides :Bdelete <type> to easily delete buffers

  -- Auto completion
  use 'cohama/lexima.vim'                   -- auto close do/end blocks and similar
  use 'alvan/vim-closetag'                  -- auto close html/xml tags

  -- Runners
  use 'tpope/vim-dispatch'                  -- generic runner, useful for fugitive
  use 'benmills/vimux'                      -- tmux integration
  use 'janko-m/vim-test'                    -- generic test runner
  use 'junegunn/vader.vim'                  -- vimscript test framework

  -- Extras
  use 'rizzatti/dash.vim'             -- External doc browser (Mac only)
  use 'neovim/nvim-lspconfig'         -- Configuration for native LSP
end)
