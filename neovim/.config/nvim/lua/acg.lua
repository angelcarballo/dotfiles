local acg = {}

-- Helper to generate autogroups and their autocommands.
-- Each autocmd is { events, pattern, action }:
--   events  - a single event or a list of them
--   pattern - as in :autocmd, comma separated patterns are split by the api
--   action  - an ex command (string) or a lua function
-- example:
--   acg.augroup("MY_GROUP", {
--     { 'BufRead', '*.rb', 'setfiletype ruby' },
--     { { 'BufRead', 'BufNewFile' }, '*.md', function() vim.bo.spell = true end },
--   })
function acg.augroup(name, autocmds)
  local group = vim.api.nvim_create_augroup(name, { clear = true })
  for _, autocmd in ipairs(autocmds) do
    local events, pattern, action = autocmd[1], autocmd[2], autocmd[3]
    local opts = { group = group, pattern = pattern }
    opts[type(action) == 'function' and 'callback' or 'command'] = action
    vim.api.nvim_create_autocmd(events, opts)
  end
end

-- Check if the given path exists
-- taken from https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua
function acg.exists(file)
  local ok, err, _ = os.rename(file, file)
  return ok, err
end

--- Check if a directory exists in this path
function acg.is_dir(path)
  return acg.exists(path .. "/") -- "/" works on both Unix and Windows
end

--- Read a whole file in binary mode
function acg.read_file(path)
  local file = io.open(path, "rb") -- (r)ead mode, (b)inary mode

  if not file then
    return
  end

  local contents = file:read("*a") -- (a)ll the file
  file:close()
  return contents
end

-- Find path for editing notes:
--   if we're in a git repository, notes are stored in the .git folder using the branch's name
--   if we're NOT in a git repository, use a generic .notes file
function acg.notes_path()
  if acg.is_dir('.git') then
    -- regular git folder
    return vim.fn.expand('$NOTES/branches/' .. acg.sanitized_branch_name())
  elseif acg.exists('.git') then
    -- git folder using worktrees. The .git file will contain a pointer to the main git repo location:
    --   gitdir: /some/folder/.git/worktrees/current-branch
    return vim.fn.expand('$NOTES/branches/' .. acg.sanitized_branch_name())
  else
    return ('.notes')
  end
end

function acg.sanitized_branch_name()
  return vim.api.nvim_eval("FugitiveHead()"):gsub("/", "-") .. '.notes'
end

-- Check if we're at the end of a word, useful to trigger completion conditionally
function acg.has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Ping function, mostly for testing
function acg.ping()
  print 'PONG'
end

-- Populate quickfix with modified, staged and untracked files
function acg.quickfix_git_changed()
  local staged_unstaged = vim.fn.systemlist('git diff --name-only HEAD')
  local untracked = vim.fn.systemlist('git ls-files --others --exclude-standard')
  local files = {}
  for _, f in ipairs(staged_unstaged) do
    if f ~= '' then table.insert(files, f) end
  end
  for _, f in ipairs(untracked) do
    if f ~= '' then table.insert(files, f) end
  end
  if #files == 0 then
    print('No changed files')
    return
  end
  vim.fn.setqflist({})
  vim.fn.setqflist(vim.tbl_map(function(f) return {filename = f, text = ''} end, files))
  vim.cmd.copen()
end

return acg
