local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.gofmt, 
    -- formatting.golines.with({
    --   args = { "-m", "180" },
    -- }),
    formatting.goimports,
    formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    formatting.stylua,
    null_ls.builtins.diagnostics.codespell, formatting.codespell,
    formatting.shfmt,
    formatting.isort, },
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
      if client.server_capabilities.document_highlight then
        vim.api.nvim_exec([[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
      end
    end
  end
})
