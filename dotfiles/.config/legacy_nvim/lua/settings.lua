local set = vim.opt

-- Sidebar
set.number = true -- line number on the left
set.relativenumber = true

set.showmatch  = true -- show matching brackets
set.scrolloff  = 8 -- always show 3 rows from edge of the screen
set.synmaxcol  = 300 -- stop syntax highlight after x lines for performance
set.laststatus = 2 -- always show status line

set.autoindent = true
set.smartindent = true
set.tabstop = 2 -- 1 tab = 2 spaces
set.shiftwidth = 2 -- indentation rule
set.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
set.expandtab = true -- expand tab to spaces
set.smarttab = true

set.incsearch = true
set.signcolumn = "yes"
set.termguicolors = true

set.listchars = { eol = '↵', tab = '  ', trail = '·', extends = '>', precedes = '<' }
set.list = true
--set.listchars:append({ extends = "tab:>\ ,trail:-,extends:>,precedes:<,eol:¬" })
set.backup = false
set.clipboard = "unnamedplus"
set.writebackup = false
set.swapfile = false


set.splitright = true

set.hidden = true

vim.cmd[[highlight QuickScopePrimary guifg='#cc0000' gui=underline ctermfg=155 cterm=underline]]
vim.cmd[[highlight QuickScopeSecondary guifg='#ffd966' gui=underline ctermfg=81 cterm=underline]]

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

