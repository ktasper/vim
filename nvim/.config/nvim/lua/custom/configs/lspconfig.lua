local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require"lspconfig/util"


-- Go Settings
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      -- Already enabled by default
      completeUnimported = true,
      -- Enable other settings See https://github.com/golang/tools/blob/master/gopls/doc/settings.md
      usePlaceholders = true,
    }
  }
}
