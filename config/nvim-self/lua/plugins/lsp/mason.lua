local ensure_installed = {
  "emmet_ls",
  "html",
  "lua_ls",
}

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    build = ":MasonUpdate",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    lazy = false,
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = ensure_installed,
    },
  },
}
