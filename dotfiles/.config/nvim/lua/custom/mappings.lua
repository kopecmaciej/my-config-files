---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- Resize window
    ["<C-Up>"] = { "<cmd> resize +5 <CR>", "Resize window up" },
    ["<C-Down>"] = { "<cmd> resize -5 <CR>", "Resize window down" },
    ["<C-Left>"] = { "<cmd> vertical resize +5 <CR>", "Resize window left" },
    ["<C-Right>"] = { "<cmd> vertical resize -5 <CR>", "Resize window right" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>cp"] = {
      "<cmd> Copilot panel <CR>",
      "Open copilot panel",
    },
    ["<leader>cs"] = {
      "<cmd> Copilot split <CR>",
      "Open copilot splited window",
    },
  },
  i = {
    ["C-a"] = {
      "copilot#Accept('<CR>')",
      "Accept copilot suggestion",
      opts = { noremap = true, silent = true, expr = true, replace_keycodes = false },
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "Resume last picker" },
  },
  v = {
    ["<leader>fg"] = { "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", "Live grep (visual)" },
  },
}

M.marks = {
  n = {
    ["<leader>mm"] = { "<cmd> MarksListAll <CR>", "Marks list" },
  },
}

M.aerial = {
  n = {
    ["<leader>A"] = { "<cmd> AerialToggle <CR>", "Toggle aerial" },
    ["<leader>aa"] = { "<cmd> AerialGo <CR>", "Go to symbol" },
    ["<leader>an"] = { "<cmd> AerialNext <CR>", "Next symbol" },
    ["<leader>ap"] = { "<cmd> AerialPrev <CR>", "Previous symbol" },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Lazygit" },
    ["<leader>gb"] = { "<cmd> GitBlameToggle <CR>", "Git blame" },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = { "<cmd> lua require('spectre').open()<CR>", "Open Spectre" },
    ["<leader>sf"] = { "<cmd> lua require('spectre').open_file_search()<CR>", "Search" },
    ["<leader>sw"] = { "<cmd> lua require('spectre').open_visual({select_word=true})<CR>", "Replace word" },
    ["<leader>ss"] = { "<cmd> lua require('spectre').open_visual()<CR>", "Replace visual" },
  },
  v = {
    ["<leader>sw"] = { "<cmd> lua require('spectre').open_visual({select_word=true})<CR>", "Replace word" },
    ["<leader>ss"] = { "<cmd> lua require('spectre').open_visual()<CR>", "Replace visual" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dv"] = {
      function()
        local dap = require "dap"
        local env_file = vim.fn.input "Path to .env file: "
        if env_file ~= "" then
          for line in io.lines(env_file) do
            local key, value = line:match "([^=]+)=([^=]+)"
            if key and value then
              vim.fn.setenv(key, value)
            end
          end
          print("Environment variables loaded from " .. env_file)
        else
          print "No file specified."
        end
      end,
      "Load environment variables",
    },
    -- start/stop/toggle
    ["<leader>dc"] = { "<cmd> lua require('dap').continue()<CR>", "Continue" },
    ["<leader>dk"] = { "<cmd> lua require('dap').disconnect()<CR>", "Disconnect" },
    ["<leader>dq"] = { "<cmd> lua require('dap').close()<CR>", "Close" },
    ["<leader>dt"] = { "<cmd> lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
    -- move around
    ["<leader>dJ"] = { "<cmd> lua require('dap').down()<CR>", "Down" },
    ["<leader>dK"] = { "<cmd> lua require('dap').up()<CR>", "Up" },
    ["<leader>ds"] = { "<cmd> lua require('dap').step_over()<CR>", "Step over" },
    ["<leader>di"] = { "<cmd> lua require('dap').step_into()<CR>", "Step into" },
    ["<leader>do"] = { "<cmd> lua require('dap').step_out()<CR>", "Step out" },
    -- helpers
    ["<leader>dr"] = { "<cmd> lua require('dap').repl.open()<CR>", "Open REPL" },
    ["<leader>de"] = { "<cmd> lua require('dap').repl.run_last()<CR>", "Run last" },
    ["<leader>du"] = { "<cmd> lua require('dapui').toggle()<CR>", "Toggle UI" },
    ["<leader>dR"] = { "<cmd> lua require('dapui').toggle({reset=true})<CR>", "Reset UI" },
    ["<leader>dh"] = { "<cmd> lua require('dap.ui.widgets').hover()<CR>", "Hover" },
    ["<leader>dp"] = { "<cmd> lua require('dap.ui.widgets').preview()<CR>", "Preview" },
    ["<leader>dS"] = {
      "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
      "Float scopes",
    },
    ["<leader>dF"] = {
      "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.frames)<CR>",
      "Float frames",
    },
    ["<leader>dE"] = {
      "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.expression)<CR>",
      "Float Expression",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

return M
