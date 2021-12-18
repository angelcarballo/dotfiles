-- vim: foldmethod=marker foldlevel=0

vim.g.os = 'Darwin'

-- {{{ Settings
vim.opt.number = true                                  -- show line numbers
vim.opt.confirm = true                                 -- ask instead of just erroring if the current file has unsaved changes
vim.opt.autowrite = true                               -- auto write after make, ! and friends
vim.opt.showcmd = true                                 -- show complete commands
vim.opt.scrolloff=3                                    -- leave space after the current line
vim.opt.swapfile = false                               -- disable swap files, let git do the work
vim.opt.splitright = true                              -- open new vertical split panes to right
vim.opt.history = 200                                  -- increase history (default: 50)
vim.opt.incsearch = true                               -- incremental search
vim.opt.ignorecase = true                              -- ignore case on search ...
vim.opt.smartcase = true                               -- ... except if query contains uppercase characters
vim.opt.infercase = true                               -- ... same thing for keyword completion
vim.opt.wrap = false                                   -- don't wrap lines when they're too long for current screen size
vim.opt.backspace = {'indent', 'eol', 'start'}         -- backspace through everything
vim.opt.wildmenu = true                                -- visual auto complete for command menu
vim.opt.wildmode = {'longest:full', 'full'}            -- complete with the longest matching substring, also show menu. Hitting tab again moves between matches
vim.opt.ttyfast = true                                 -- send extra characters to terminal (improves smoothness)
vim.opt.formatoptions:append('j')                      -- delete comment character when joining commented lines
vim.opt.autoread = true                                -- if a file changes outside Vim, reload its contents automatically
vim.opt.undofile = true                                -- persist undo history
vim.opt.breakindent = true                             -- keep indentation on wrapped lines
vim.opt.shiftwidth = 2                                 -- space identation use 2 spaces by default (file types override this)
vim.opt.tabstop = 2                                    -- tabs use 2 spaces by default (file types override this)
vim.opt.expandtab = true                               -- indent with spaces by default (override by file type)
vim.opt.regexpengine = 1                               -- use old regexp engine, as new one has low performance with big ruby files
vim.opt.spelllang = 'en_us'                            -- enable English spell check
vim.opt.spellsuggest = {'fast','20'}                   -- don't show too many suggestions for spell check
vim.opt.spellcapcheck= ''                              -- don't check for end of sentence and capitalization, it doesn't work well with abbreviations
vim.opt.dictionary:append('/usr/share/dict/words')     -- auto complete words from system dictionary
vim.opt.tags:prepend('./.git/tags')                    -- read tags from git directory
vim.opt.foldenable = false                             -- do not fold by default
vim.opt.shortmess:remove('S')                          -- show total and number of current result after a search
vim.opt.hidden = true                                  -- allow closing buffers with unsaved changes
vim.opt.mouse = 'a'                                    -- enable mouse support in all modes
vim.opt.spellfile = '~/Drive/vim/spell/en.utf-8.add'   -- point to custom spell file from Synology Drive
vim.opt.diffopt = {
  'filler',                                            -- show filler lines to keep diffs aligned
  'internal',                                          -- use vim's internal diff library
  'indent-heuristic',                                  -- use vim's internal diff library for indentation
  'algorithm:histogram'                                -- histogram is better at highlighting line changes
}
vim.opt.completeopt = {
  'menu',                                              -- show popup menu for completion
  'menuone'                                            -- show popup menu even if there is only one result
}
vim.opt.complete= {
  '.',                                                 -- complete with words from current buffer
  'w',                                                 -- complete with words from other windows
}
vim.opt.grepprg = 'rg --vimgrep --hidden --smart-case' -- use ripgrep, much faster than regular grep
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'            -- use ripgrep's format
-- }}}

require('plugins')
require('plugin_settings')
require('abbreviations')
require('commands')
require('operators')
require('forced_file_types')
require('path_and_ignored_patterns')
require('look_and_feel')
require('text_objects')
require('mappings')
require('auto_commands')
