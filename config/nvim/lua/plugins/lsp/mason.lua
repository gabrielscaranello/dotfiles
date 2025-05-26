local ensure_installed = {
  -- bash
  "bashls",
  "bash-debug-adapter",
  "bash-language-server",
  "shellcheck",
  "shfmt",

  -- Docker
  "docker-compose-language-service",
  "dockerfile-language-server",
  "dockerls",
  "hadolint",

  -- Go
  "delve",
  "goimports",
  "gomodifytags",
  "gopls",
  "gotests",
  "iferr",
  "impl",

  -- GraphQL
  "graphql-language-service-cli",

  -- Json
  "json-lsp",
  "jsonls",

  -- Markdown
  "marksman",

  -- HTML/JSX/TSX/TS/JS
  "css-lsp",
  "cssls",
  "emmet-ls",
  "emmet_ls",
  "eslint-lsp",
  "html",
  "html-lsp",
  "prettierd",
  "vue_ls",
  "vtsls",

  -- Lua
  "lua-language-server",
  "lua_ls",
  "luacheck",
  "stylua",

  -- Prisma
  "prismals",
  "prisma-language-server",

  -- Proto
  "buf",
  "pbls",

  -- Yaml
  "yaml-language-server",
  "yamlls",
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
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = ensure_installed,
    },
  },
}
