local wk = require("which-key")

wk.register({
  f = {
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, 
    b = { "<cmd>Telescope buffers<cr>", "Open Buffer List" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" }
  },
}, { prefix = "<leader>" })
