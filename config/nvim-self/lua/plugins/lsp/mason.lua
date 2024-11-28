local mason_lsp = {
  "emmet_ls",
  "html",
  "lua_ls",
  "vtsls",
  "volar",
}

local mason_tool = {
  -- formaters
  "stylua",
  "prettierd",

  -- linters
  "eslint-lsp",
  "luacheck",
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
      ensure_installed = mason_lsp,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = mason_tool,
    },
  },
}
