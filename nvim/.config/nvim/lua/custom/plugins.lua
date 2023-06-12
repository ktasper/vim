local plugins ={
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  -- Mason Config, ensures packages are installed.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
    -- Null LS
    {
      "jose-elias-alvarez/null-ls.nvim",
        -- Filetypes
      ft = "go",
      opts = function ()
        return require "custom.configs.null-ls"
      end

    },
  },
}
return plugins
