-- Fuzzy pickers built on the command line popup
-- :help fuzzy-file-picker

local FILES_CMD = 'rg --files --hidden --glob "!.git"'
local MAX_RESULTS = 20

-- Caches are rebuilt at most once per command line, see CmdlineEnter below
local caches = {}

-- Fuzzy match `query` against `candidates`, the full list when nothing is typed
local function fuzzy_match(candidates, query)
  if query == '' then return candidates end

  return vim.fn.matchfuzzy(candidates, query)
end

-- Keep only the best matches, then reverse: the popup renders above the command
-- line, so the last item is the one nearest the prompt. Display only, resolving
-- still runs over every match and takes the best
local function for_display(matches)
  local out = {}
  for i = math.min(#matches, MAX_RESULTS), 1, -1 do table.insert(out, matches[i]) end

  return out
end

-- Called by `:find`, both to complete and to resolve the final argument
function _G.acg_find(cmdarg, cmdcomplete)
  if vim.tbl_isempty(caches.files or {}) then
    -- Same tool as 'grepprg', so both respect .gitignore in the same way
    caches.files = vim.fn.systemlist(FILES_CMD)
  end

  local matches = fuzzy_match(caches.files, cmdarg)

  return cmdcomplete and for_display(matches) or matches
end

-- Turn `:find` into a fuzzy file picker
-- Note this bypasses 'path', which is still used by `gf`, `:sfind` and `[i`
vim.o.findfunc = 'v:lua.acg_find'

-- Define a command that fuzzy completes over `candidates()` and runs `action`
-- on the result. Pressing <cr> without picking from the menu uses the best
-- match, so these behave like `:find` does through 'findfunc'
local function fuzzy_command(name, candidates, action, desc)
  local key = name:lower()

  local function matches(query)
    if caches[key] == nil then caches[key] = candidates() end

    return fuzzy_match(caches[key], query)
  end

  vim.api.nvim_create_user_command(name, function(cmd)
    local best = matches(cmd.args)[1]
    if best then action(best) end
  end, {
    nargs = '*', -- Accept spaces, so paths containing them still resolve
    complete = function(arglead) return for_display(matches(arglead)) end,
    desc = desc
  })
end

local function edit(path) vim.cmd.edit(vim.fn.fnameescape(path)) end

-- `:buffer` only matches substrings, so resolve the choice back to a number
local buffer_numbers = {}

fuzzy_command('Buffer', function()
  buffer_numbers = {}
  local names = {}

  for _, buffer in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if buffer.name ~= '' then
      local name = vim.fn.fnamemodify(buffer.name, ':.')
      buffer_numbers[name] = buffer.bufnr
      table.insert(names, name)
    end
  end

  return names
end, function(name) vim.cmd.buffer(buffer_numbers[name] or name) end, 'Fuzzy switch buffer')

-- Every file, including the ones ignored by git
fuzzy_command('FindAll', function()
  return vim.fn.systemlist('rg --files --hidden --no-ignore --glob "!.git"')
end, edit, 'Fuzzy find any file, including ignored ones')

-- Modified, staged and untracked files
fuzzy_command('Modified', function()
  local changed = vim.fn.systemlist('git diff --name-only HEAD')
  local untracked = vim.fn.systemlist('git ls-files --others --exclude-standard')
  return vim.list_extend(changed, untracked)
end, edit, 'Fuzzy find a file changed since HEAD')

-- Previously edited files, most recent first
fuzzy_command('Oldfiles', function()
  return vim.tbl_filter(function(f) return vim.fn.filereadable(f) == 1 end, vim.v.oldfiles)
end, edit, 'Fuzzy find a recently edited file')

fuzzy_command('Notes', function()
  return vim.fn.systemlist(FILES_CMD .. ' ' .. vim.fn.expand('$NOTES'))
end, edit, 'Fuzzy find a note')

fuzzy_command('Branch', function()
  return vim.fn.systemlist('git branch --format="%(refname:short)" --sort=-committerdate')
end, function(branch) vim.cmd('Git switch ' .. vim.fn.shellescape(branch)) end, 'Fuzzy switch git branch')

-- `:Symbol` completes over names, so resolve the choice back to a position
local symbol_positions = {}

-- Document symbols for the current buffer. Blocking, but the result is cached for
-- the rest of the command line, so this runs once per `:Symbol` rather than once
-- per keystroke
local function document_symbols()
  symbol_positions = {}

  local buffer = vim.api.nvim_get_current_buf()
  local client = vim.lsp.get_clients({ bufnr = buffer, method = 'textDocument/documentSymbol' })[1]
  if not client then return {} end

  local response = client:request_sync(
    'textDocument/documentSymbol',
    { textDocument = vim.lsp.util.make_text_document_params(buffer) },
    1000,
    buffer
  )
  if not response or response.err or not response.result then return {} end

  local names = {}

  -- Flattens nested symbols and converts LSP's UTF-16 columns to byte offsets
  for _, item in ipairs(vim.lsp.util.symbols_to_items(response.result, buffer, client.offset_encoding)) do
    -- The line keeps overloads and same named symbols apart
    local name = item.text:gsub('^%[%w+%]%s*', '') .. ':' .. item.lnum
    symbol_positions[name] = { item.lnum, math.max(item.col - 1, 0) }
    table.insert(names, name)
  end

  return names
end

fuzzy_command('Symbol', document_symbols, function(name)
  local position = symbol_positions[name]
  if not position then return end

  vim.cmd("normal! m'") -- Leave a jumplist entry, so `<c-o>` comes back
  vim.api.nvim_win_set_cursor(0, position)
  vim.cmd('normal! zz')
end, 'Fuzzy jump to a symbol in the buffer')

-- Live grep: 'grepprg' runs on every keystroke and the matches become the
-- completion menu, see :help live-grep
local grep_selected = nil

local function grep_matches(arglead)
  -- Below two characters the result set is too big to be useful
  if #arglead < 2 then return {} end

  local prg = vim.o.grepprg
  if not prg:find('%$%*', 1) then prg = prg .. ' $*' end

  local pattern = vim.fn.shellescape(vim.fn.escape(arglead, '\\'))

  return vim.fn.systemlist((prg:gsub('%$%*', function() return pattern end, 1)))
end

local function grep_complete(arglead) return for_display(grep_matches(arglead)) end

vim.api.nvim_create_user_command('Grep', function(cmd)
  -- Nothing was highlighted, so fall back to the best match for what was typed
  local match = grep_selected or grep_matches(cmd.args)[1]
  grep_selected = nil
  if not match then return end

  -- 'grepformat' knows how to turn a match back into a file, line and column
  local item = vim.fn.getqflist({ lines = { match } }).items[1]
  if not item or item.bufnr == 0 then return end

  vim.bo[item.bufnr].buflisted = true
  vim.api.nvim_win_set_buf(0, item.bufnr)
  vim.api.nvim_win_set_cursor(0, { item.lnum, math.max(item.col - 1, 0) })
end, { nargs = '*', complete = grep_complete, desc = 'Live grep the project' })

local cmdline_group = vim.api.nvim_create_augroup('CmdlineAutocomplete', {})

-- Show the completion menu while typing, see :help cmdline-autocompletion
vim.api.nvim_create_autocmd('CmdlineChanged', {
  group = cmdline_group,
  pattern = { ':', '/', '?' },
  callback = function()
    -- Commands show all their candidates straight away, so `:find ` lists every
    -- file. An empty command line is left alone, as neither the full command
    -- list nor every search term is worth a menu. <tab> still opens those
    if vim.fn.getcmdline() ~= '' then vim.fn.wildtrigger() end
  end,
})

-- The external commands only run when a picker is actually used, so dropping
-- the caches on every `:` is cheap
vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = cmdline_group,
  pattern = ':',
  callback = function() caches = {} end,
})

-- `:Grep` completion returns "file:line:col:text" matches rather than an
-- argument, so remember the highlighted one and restore the command line
vim.api.nvim_create_autocmd('CmdlineLeavePre', {
  group = cmdline_group,
  pattern = ':',
  callback = function()
    if not vim.fn.getcmdline():match('^%s*Grep%s') then return end

    local info = vim.fn.cmdcomplete_info()
    local matches = info.matches or {}
    if vim.tbl_isempty(matches) then return end

    -- Matches are reversed, so the best one is last when nothing is selected
    grep_selected = matches[info.selected + 1] or matches[#matches]
    vim.fn.setcmdline(info.cmdline_orig)
  end,
})
