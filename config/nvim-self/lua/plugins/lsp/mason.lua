local ensure_installed_ls = {
  "emmet_ls",
  "html",
  "lua_ls",
}

local ensure_installed_formaters = {
  "stylua",
  "prettier",
}

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
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
      ensure_installed = ensure_installed_ls,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = ensure_installed_formaters,
    },
  },
}
