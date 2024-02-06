local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  b.formatting.deno_fmt,
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "json", "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
  b.formatting.stylua,
  b.formatting.gofmt,
  b.formatting.clang_format,
  b.formatting.black,

  b.diagnostics.eslint.with {
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },

  b.formatting.sql_formatter.with {
    filetypes = { "sql" },
  },
}

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}
