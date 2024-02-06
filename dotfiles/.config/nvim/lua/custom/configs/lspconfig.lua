local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "tailwindcss",
  "jsonls",
  "gopls",
  "eslint",
  "helm_ls",
  "terraformls",
  "pyright",
  "jdtls",
  "marksman",
  "clangd",
  "jdtls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local path = vim.fn.stdpath "config" .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

lspconfig.ltex.setup {
  settings = {
    ltex = {
      disabledRules = {
        ["en-US"] = { "PROFANITY" },
        ["en-GB"] = { "PROFANITY" },
      },
      dictionary = {
        ["en-US"] = words,
        ["en-GB"] = words,
      },
    },
  },
}

lspconfig.lua_ls.setup {
  on_init = function(client, initialization_result)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.semanticTokensProvider = false -- turn off semantic tokens
    end
  end,
  on_attach = function(client, bufnr) end,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

