local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  size = 15,
  open_mapping = [[<A-d>]],
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  float_opts = {
    border = 'curved', -- or 'double'
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

function _Lazygit_toggle()
  lazygit:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _Ncdu_toggle()
  ncdu:toggle()
end

