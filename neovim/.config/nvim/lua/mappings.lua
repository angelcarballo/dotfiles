--- vim: foldmethod=marker foldlevel=0

local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

-- Use <sapce> as leader key
vim.g.mapleader = ' '

-- Use Tab for aucocompletion
map {'i', '<tab>', '<c-r>=Tab_Or_Complete()<cr>'}

-- Basic mappings ----------------------------------------------------------------- {{{

map {'i', 'kj', '<esc>'} -- easily exit insert mode
map {'n', 'Q', '<nop>'} -- don't go inTo Ex mode
map {'n', '<leader><space>', '<cmd>Telescope buffers<cr>'} -- switch to buffers using FZF
map {'n', '<tab>', '<c-^>'} -- quick toggle between last two buffers

-- Move around using visual lines, useful when wrap is enabled
map {'n', 'j', 'gj'}
map {'n', 'k', 'gk'}

-- }}}
-- Leader mappings ---------------------------------------------------------------- {{{

-- /,? - Search in project
-- Use -F by default to disable regexp and search for a literal string
map {'n', '<leader>/', 'mZ:silent grep -F ""<left>'}
map {'n', '<leader>?', 'mZ:silent grep -F -g !test ""<left>'}

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
map {'n', '<leader>fF', "<cmd>lua require'telescope.builtin'<cr>"}
map {'n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>"}
map {'n', '<leader>fg', '<cmd>Telescope git_status<cr>'}
map {'n', '<leader>fr', '<cmd>Telescope oldfiles<cr>'}
map {'n', '<leader>fh', '<cmd>Telescope help_tags<cr>'}
map {'n', '<leader>fm', '<cmd>Telescope marks<cr>'}
-- map {'n', '<leader>fl', '<cmd>Telescope lsp_code_actions<cr>'}

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

map {'n', '<leader>k', '<Plug>DashSearch'}

-- m - marks
map {'n', '<leader>mm', '<Plug>BookmarkToggle'}
map {'n', '<leader>ma', '<Plug>BookmarkShowAll'}
map {'n', '<leader>md', '<Plug>BookmarkClearAll'}
map {'n', ']m', '<Plug>BookmarkNext'}
map {'n', '[m', '<Plug>BookmarkPrev'}

-- q - Quit
map {'n', '<leader>q', ':q<cr>'}
map {'n', '<leader>Q', ':qall!<cr>'}

-- n - notes
map {'n', '<leader>nn', ':execute "edit ".BranchNotesPath()<cr>'}

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
map {'n', '<leader>Ve', ':e $MYVIMRC<cr>'}
map {'n', '<leader>Vs', ':so $MYVIMRC<cr>'}

-- w - Windows/Tabs
map {'n', '<leader>wo', ':only<cr>'}
map {'n', '<leader>we', '<c-w>='}
map {'n', '<leader>ws', ':sp<cr>'}
map {'n', '<leader>wt', ':tabedit %<cr>'}
map {'n', '<leader>wv', ':vsp<cr>'}


-- Non-leader mappings

-- auto close pairs
map {'i', '(<cr>', '(<cr>)<c-o>O<tab>'}
map {'i', '[<cr>', '[<cr>]<c-o>O<tab>'}
map {'i', '{<cr>', '{<cr>}<c-o>O<tab>'}

-- pane navigation
map {'n', '<c-h>', '<c-w>h'}
map {'n', '<c-j>', '<c-w>j'}
map {'n', '<c-k>', '<c-w>k'}
map {'n', '<c-l>', '<c-w>l'}

-- Fix closest spelling error
map {'i', '<c-f>', '<c-g>u<esc>[s1z=`]a<c-g>u'}

-- go back to default local mark (m)
map {'n', 'gb', '`m'}

-- go back after grep and friend (their mappings auto set mark Z)
map {'n', 'gB', '`Z'}

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

-- }}}
-- Unimpaired style --------------------------------------------------------------- {{{

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
map {'n', 'com', ':call ToggleExUnitIex()<cr>'}
map {'n', 'con', ':setlocal number! number?<cr>'}
map {'n', 'cop', ':setlocal paste! paste?<cr>'}
map {'n', 'coq', ':call ToggleQuickFix()<cr>'}
map {'n', 'cos', ':setlocal spell! spell?<cr>'}
map {'n', 'cot', ':call ToggleVimuxTarget()<cr>'}
map {'n', 'cow', ':setlocal wrap! wrap?<cr>'}

-- }}}
-- Operators ---------------------------------------------------------------------- {{{

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

-- }}}
-- LSP mappings and configuration ------------------------------------------------- {{{

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

  -- Use LSP as the handler for formatexpr.
  buf_set_option('formatexpr', 'v:lua.vim.lsp.formatexpr()')

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
