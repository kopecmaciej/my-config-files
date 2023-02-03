require("nvim-lsp-installer").setup {
  automatic_installation = true
}
local lspconfig = require('lspconfig')

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = true,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local buf_keymap = vim.api.nvim_buf_set_keymap
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require('nvim-lsp-ts-utils').setup({
    filter_out_diagnostics_by_code = { 80001 },
  })
  require('nvim-lsp-ts-utils').setup_client(client)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- if client.name == "tsserver" then
  --   client.server_capabilities.document_formatting = false -- 0.7 and earlier
  --   client.resolved_capabilities.document_formatting = false
  -- end
  buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  buf_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local strategy = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_matching_strategy_list = strategy
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'sumneko_lua', 'dockerls', 'eslint', "tsserver" }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

lspconfig.jsonls.setup {
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  settings = {
    yaml = {
      trace = {
        server = "verbose"
      },
      schemaStore = {
        url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.20.5-standalone-strict/_definitions.json"
      },
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/*.yaml",
        kubernetes = "/*.yml"
      },
      schemaDownload = { enable = true },
      validate = { enable = true },
    }
  },
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'less' },
})
