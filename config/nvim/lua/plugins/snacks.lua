local config = require "config.snacks"

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  keys = {
    -- Explorer
    { "<leader>e", config.explorer.toggle, { desc = "Explorer (keep open)" } },
    { "<leader>o", config.explorer.focus, { desc = "Explorer (auto close)" } },

    -- Diagnostics and LSP
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Document Symbols" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },

  ---@type snacks.Config
  opts = {
    dashboard = { enabled = false },
    indent = {
      enabled = true,
      animate = {
        style = "out",
        easing = "linear",
        duration = { step = 30, total = 400 },
      },
    },
    input = {
      enabled = true,
      relative = "cursor",
      row = -3,
      col = 0,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = { layout = { position = "right" } },
          on_show = config.explorer.on_show,
          on_close = config.explorer.on_close,
        },
      },
    },
  },
}
