---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "checkmake",
        "editorconfig_checker",
        "jq",
        "jsonlint",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
