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

-- Trouble
keymap("n", "<leader>tx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)

-- Lspsaga
keymap("n", "<leader>gt", "<cmd>Lspsaga toogle_cirtual_text<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Lspsaga preview_definition<cr>", opts)
keymap("n", "<leader>cc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<leader>K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "<F2>", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<cr>", opts)
keymap("t", "<A-d>", "<cmd>Lspsaga close_floaterm<cr>", opts)

-- Format without language server
keymap("n", "<space>n", '<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<cr>', opts)


