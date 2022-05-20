-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/kyazdani42/nvim-tree.lua#keybindings

-- Note: options under the g: command should be set BEFORE running the
-- setup function: https://github.com/kyazdani42/nvim-tree.lua#setup
-- Default options ARE NOT included.
-- See: `:help NvimTree`


-- Global options
local g = vim.g

g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_icons = { default = "" }
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

-- Call setup:
--- Each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup {
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  update_cwd = true,
  view = { width = 32, side = "left" },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  }, 
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    ignore = false,
  },
  actions = {
    change_dir = { enable = false },
        open_file = {
            resize_window = true
        }
  },
  update_focused_file = {
    enable = false,
    update_cwd = true,
  },
  filters = {
    dotfiles = true,
    custom = { 'node_modules', '.bin' },
  },
}

