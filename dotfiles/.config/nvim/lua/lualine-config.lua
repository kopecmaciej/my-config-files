local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    theme = 'gruvbox'
  },
  -- sections = { lualine_c = { require('auto-session-library').current_session_name } }
})
