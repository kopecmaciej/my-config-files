local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Move around splits using Ctrl + {h,j,k,l}
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)            -- open/close
keymap('n', '<leader>f', ':NvimTreeRefresh<CR>', opts)       -- refresh
keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', opts)      -- search file

-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Clear search highlighting with <leader> and c
keymap('n', '<leader>c', ':nohl<CR>', opts)

-- Fast saving with <leader> and s
keymap('n', '<leader>s', ':w<CR>', opts)
keymap('i', '<leader>s', '<C-c>:w<CR>', opts)

