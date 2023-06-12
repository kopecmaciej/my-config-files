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

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

-- Call setup:
--- Each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup {
  open_on_tab = true,
  update_cwd = true,
  view = { width = 32, side = "left" },
  respect_buf_cwd = true,
  renderer = {
    highlight_git = true,
    highlight_opened_files = "blue",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        folder = {
          default = "",
          open = "",
          empty_open = "",
          empty = "",
          symlink = "",
          arrow_closed = "",
          arrow_open = "",
          symlink_open = "",
        }
      }

    }
  },
  diagnostics = {
    enable = true,
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

