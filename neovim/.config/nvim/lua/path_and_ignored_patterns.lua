local set = vim.opt

-- System include folder is added by default, no need for it
set.path:remove('/usr/include')

-- Generic folders (ruby, elixir, etc...)
set.path:append('lib/**,app/**,spec/**,test/**,config/**,bin/**,scripts/**,priv/**')

-- Generic folders (elixir umbrella)
set.path:append('apps/*/lib/**,apps/*/test/**,apps/*/config/**,apps/*/scripts/**,apps/*/priv/**')

-- Elixir/Phoenix
set.path:append('assets/*,assets/js/**,assets/css/**,assets/static/**,assets/vendor/**')

set.wildignore:append('*.swp,*.bak,*.pyc,*.class')   -- Common
set.wildignore:append('/tmp/*,*.so,*.zip,.DS_Store') -- MacOSX/Linux
set.wildignore:append('\\tmp\\*,*.zip,*.exe')        -- Windows
set.wildignore:append('/temp/*,*/backup/*')          -- Vim
set.wildignore:append('/_site/*')                    -- Jekyll
set.wildignore:append('/log/*,*.log')                -- log files
set.wildignore:append('.eof,*.ttf,*.woff')           -- font files
set.wildignore:append('*/node_modules/**')           -- node artefacts
