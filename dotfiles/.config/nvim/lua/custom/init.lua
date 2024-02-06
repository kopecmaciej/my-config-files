local opt = vim.opt
local keymap = vim.keymap

require("custom.configs.dap")

opt.clipboard = "unnamedplus"
opt.listchars:append("space: ,eol:¬")
-- trail = "·", extends = "»", precedes = "«", nbsp = "␣", eol = '¬' 
opt.list = true

opt.spelllang = "en_gb"
opt.spellfile = vim.fn.stdpath "config" .. "/spell/en.utf-8.add"
opt.swapfile = false

keymap.set(
	"i",
	"<C-a>",
	"copilot#Accept('<CR>')",
	{ noremap = true, silent = true, expr = true, replace_keycodes = false }
)

keymap.set(
  "i",
  "<C-enter>",
  "copilot#Panel()",
  { noremap = true, silent = true, expr = true, replace_keycodes = false }
)

