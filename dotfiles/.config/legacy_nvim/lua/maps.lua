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

keymap('i', '<C-b>', '<ESC>^i', opts)
keymap('i', '<C-e>', '<End>', opts)

-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Clear search highlighting with <leader> and c
keymap('n', '<leader>c', ':nohl<CR>', opts)

-- Fast saving 
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>wa', ':wa<CR>', opts)
keymap('n', '<leader>qq', ':qa!<CR>', opts)

-- Trouble
keymap("n", "<leader>tx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
keymap("n", "gi", "<cmd>Trouble lsp_implementations<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)

-- Lspsaga
keymap("n", "<leader>lt", "<cmd>Lspsaga toogle_cirtual_text<cr>", opts)
keymap("n", "<leader>ld", "<cmd>Lspsaga preview_definition<cr>", opts)
keymap("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
keymap("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

-- terminal
--lazygit
keymap("n", "<leader>gl", ":lua _Lazygit_toggle()<CR>", term_opts)
keymap("n", "<leader>ncu", ":lua _Ncdu_toggle()<CR>", term_opts)

-- Copilot
keymap("i", "<C-a>", "copilot#Accept('<CR>')", { expr = true, silent = true })

-- Buffers
-- Move to previous/next
keymap('n', '<S-TAB>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<TAB>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<C-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<C->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- aerial
keymap("n", "<leader>aa", "<cmd>AerialToggle!<CR>", opts)
keymap("n", "<leader>ad", "<cmd>Telescope aerial<cr>", opts)

-- Session
keymap("n", "<leader>ss", "<cmd>SessionSave<cr>", opts)
keymap("n", "<leader>so", "<cmd>SessionLoad<cr>", opts)
keymap("n", "<leader>sl", "<cmd>SessionLoadLast<cr>", opts)
keymap("n", "<leader>st", "<cmd>SessionToggle<cr>", opts)


