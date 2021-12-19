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

function acg.set_theme(colorscheme, background)
  vim.opt.background = background
  vim.cmd('colorscheme ' .. colorscheme)
end

-- Set theme/colorscheme based on MacOs Dark/Light mode
function acg.auto_set_theme()
  local cmd = assert(io.popen('defaults read -g AppleInterfaceStyle', 'r'))
  local output = assert(cmd:read('*a'))
  cmd:close()

  if string.find(output, 'Dark') then
    acg.set_theme('catppuccin', 'dark')
  else
    acg.set_theme('solarized-flat', 'light')
  end
end

-- Check if the given path exists
-- taken from https://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua
function acg.exists(file)
   local ok, err, code = os.rename(file, file)
   return ok, err
end

--- Check if a directory exists in this path
function acg.is_dir(path)
   return acg.exists(path.."/") -- "/" works on both Unix and Windows
end

-- Find path for editing notes:
--   if we're in a git repository, notes are stored in the .git folder using the branch's name
--   if we're NOT in a git repository, use a generic .notes file
function acg.notes_path()
  if acg.is_dir('.git') then
    return '.git/' .. vim.api.nvim_eval('FugitiveHead()')
  else
    return('.notes')
  end
end

-- Ping function, mostly for testing
function acg.ping()
  print 'PONG'
end

return acg
