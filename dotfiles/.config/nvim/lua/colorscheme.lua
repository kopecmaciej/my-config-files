local colorscheme = "gruvbox"

-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_dark_float = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd [[highlight QuickScopePrimary guifg='#cc0000' gui=underline ctermfg=155 cterm=underline]]
vim.cmd [[highlight QuickScopeSecondary guifg='#ffd966' gui=underline ctermfg=81 cterm=underline]]

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
