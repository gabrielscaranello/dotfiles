local ensure_installed = {
  -- bash
  "bashls",
  "bash-debug-adapter",
  "bash-language-server",
  "shellcheck",
  "shfmt",

  -- Go
  "delve",
  "goimports",
  "gomodifytags",
  "gopls",
  "gotests",
  "iferr",
  "impl",

  -- HTML/JSX/TSX/TS/JS
  "emmet_ls",
  "eslint-lsp",
  "html",
  "prettierd",
  "volar",
  "vtsls",

  -- Lua
  "lua_ls",
  "luacheck",
  "stylua",
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
      ensure_installed = ensure_installed,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = ensure_installed,
    },
  },
}
