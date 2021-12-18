local acg = {}

-- Helper to generakjb
-- Exmaple: acg.augroup("MY_GROUP", { 'Bufread', '*.rb', 'setfiletype ruby'}, {...})
function acg.augroup(name, autocmds)
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    vim.cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  vim.cmd('augroup END')
end

function acg.map(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

return acg
