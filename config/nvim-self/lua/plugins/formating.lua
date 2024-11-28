return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>lf",
      function() require("conform").format { formatters = { "injected" } } end,
      mode = { "n", "v" },
      desc = "Format File or Range (in visual mode)",
    },
  },

  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      scss = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "prettier" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
}
