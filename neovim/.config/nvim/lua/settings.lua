local set = vim.opt

set.number = true
set.confirm = true                             -- ask instead of just erroring if the current file has unsaved changes
set.autowrite = true                           -- auto write after make, ! and friends
set.showcmd = true                             -- show complete commands
set.scrolloff=3                                -- leave space after the current line
set.swapfile = false                           -- disable swap files, let git do the work
set.splitright = true                          -- open new vertical split panes to right
set.history = 200                              -- increase history (default: 50)
set.incsearch = true                           -- incremental search
set.ignorecase = true                          -- ignore case on search ...
set.smartcase = true                           -- ... except if query contains uppercase characters
set.infercase = true                           -- ... same thing for keyword completion
set.wrap = false                               -- don't wrap lines when they're too long for current screen size
set.backspace = {'indent', 'eol', 'start'}     -- backspace through everything
set.wildmenu = true                            -- visual auto complete for command menu
set.wildmode = {'longest:full', 'full'}        -- complete with the longest matching substring, also show menu. Hitting tab again moves between matches
set.ttyfast = true                             -- send extra characters to terminal (improves smoothness)
set.formatoptions:append('j')                  -- delete comment character when joining commented lines
set.autoread = true                            -- if a file changes outside Vim, reload its contents automatically
set.undofile = true                            -- persist undo history
set.joinspaces = false                         -- only insert one space when joining after an '.'
set.breakindent = true                         -- keep indentation on wrapped lines
set.shiftwidth = 2                             -- space identation use 2 spaces by default (file types override this)
set.tabstop = 2                                -- tabs use 2 spaces by default (file types override this)
set.expandtab = true                           -- indent with spaces by default (override by file type)
set.regexpengine = 1                           -- use old regexp engine, as new one has low performance with big ruby files
set.spelllang = 'en_us'                        -- enable English spell check
set.spellsuggest = {'fast','20'}               -- don't show too many suggestions for spell check
set.spellcapcheck= ''                          -- don't check for end of sentence and capitalization, it doesn't work well with abbreviations
set.dictionary:append('/usr/share/dict/words') -- auto complete words from system dictionary
set.tags:prepend('./.git/tags')                -- read tags from git directory
set.foldenable = false                         -- do not fold by default
set.shortmess:remove('S')                      -- show total and number of current result after a search
set.hidden = true                              -- allow closing buffers with unsaved changes

set.spellfile = '~/Drive/vim/spell/en.utf-8.add' -- point to custom spell file from Synology Drive
set.diffopt = {'filler', 'internal', 'algorithm:histogram', 'indent-heuristic'}

-- setup completion (affects c-n, c-p, c-x c-n, c-x c-p)
set.complete= {
  '.', --  complete with words from current buffer
  'w', --  complete with words from other windows
  'b', --  complete with words from other loaded buffers
  'u', --  complete with words from other unloaded buffers
  't'  --  complete with tags
}

-- if executable('rg')
  -- " Use ripgrep over Grep
  -- set grepprg=rg\ --vimgrep\ --no-heading\ --hidden\ --smart-case
  -- set grepformat=%f:%l:%c:%m,%f:%l:%m
-- endif

-- " Activate bracketed paste in tmux
-- if &term =~ "screen"
-- let &t_BE = "\e[?2004h"
-- let &t_BD = "\e[?2004l"
-- exec "set t_PS=\e[200~"
-- exec "set t_PE=\e[201~"
-- endif
