local acg = {}

-- Helper to generate autogroups and their autocommands
-- exmaple: acg.augroup("MY_GROUP", { 'Bufread', '*.rb', 'setfiletype ruby'}, {...})
function acg.augroup(name, autocmds)
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    vim.cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  vim.cmd('augroup END')
end

-- Helper to generate mappings
-- example: { 'i', '<leader>xx', ':Foo<cr>', noremap = false }
function acg.map(key)
  local opts = {noremap = true} -- default options

  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

-- Helper to set colorscheme and background together
function acg.set_theme(colorscheme, background)
  vim.opt.background = background
  vim.cmd('colorscheme ' .. colorscheme)
end

-- Set theme/colorscheme based on MacOs Dark/Light mode
function acg.auto_set_theme()
  -- we have to redirect output to avoid flicker
  local result = os.execute([[sh -c "defaults read -g AppleInterfaceStyle &> /dev/null"]])

  -- The shell command succeeds (0 result code) in dark mode
  if result == 0 then
    acg.set_theme('zenbones', 'dark')
  else
    acg.set_theme('zenbones', 'light')
  end

  os.execute('tmux source-file ~/.tmux.conf')
end

-- Check if the given path exists
-- taken from https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua
function acg.exists(file)
   local ok, err, _ = os.rename(file, file)
   return ok, err
end

--- Check if a directory exists in this path
function acg.is_dir(path)
   return acg.exists(path.."/") -- "/" works on both Unix and Windows
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
    return '.git/' .. acg.sanitized_branch_name()
  elseif acg.exists('.git') then
    -- git folder using worktrees. The .git file will contain a pointer to the main git repo location:
    --   gitdir: /some/folder/.git/worktrees/current-branch
    local path = acg.read_file('.git')
    local from, _ = path.find(path, '/')
    _, to = path.find(path, '.git/')
    return path.sub(path, from, to) .. acg.sanitized_branch_name()
  else
    return('.notes')
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

return acg
