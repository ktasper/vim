local null_ls = require("null-ls")
-- Setup autoformatting to run on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  -- Will run when we run 'vim.lsp.buf.format()' on the correct files
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    -- Begin Format on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  -- End Format on save
}
return opts
