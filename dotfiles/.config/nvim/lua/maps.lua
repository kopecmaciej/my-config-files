local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Move around splits using Ctrl + {h,j,k,l}
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts) -- open/close
keymap('n', '<leader>f', ':NvimTreeRefresh<CR>', opts) -- refresh
keymap('n', '<C-f>', ':NvimTreeFindFile<CR>', opts) -- search file


keymap('i', '<A-l>', '<C-o>a', opts)
keymap('i', '<A-k>', '<C-o>k', opts)

-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Clear search highlighting with <leader> and c
keymap('n', '<leader>c', ':nohl<CR>', opts)

-- Fast saving with <leader> and s
keymap('n', '<leader>s', ':w<CR>', opts)

-- Trouble
keymap("n", "<leader>tx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

-- Lspsaga
keymap("n", "<leader>gt", "<cmd>Lspsaga toogle_cirtual_text<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Lspsaga preview_definition<cr>", opts)
keymap("n", "<leader>cc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

-- terminal
--lazygit
keymap("n", "<leader>lg", ":lua _lazygit_toggle()<CR>", term_opts)
keymap("n", "<leader>ncu", ":lua _ncdu_toggle()<CR>", term_opts)

-- Format without language server
keymap("n", "<space>n", '<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<cr>', opts)

-- Bufferline
keymap("n", "<TAB>", '<cmd>BufferLineCycleNext<CR>', opts)
keymap("n", "<S-TAB>", '<cmd>BufferLineCyclePrev<CR>', opts)

keymap("n", "<leader>1", '<cmd>BufferLineGoToBuffer 1<CR>', opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)

keymap("i", "<C-a>", "copilot#Accept('<CR>')", { expr = true, silent = true })
