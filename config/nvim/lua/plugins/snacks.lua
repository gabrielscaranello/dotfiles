local config = require "config.snacks"

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  keys = {
    { "<leader>e", config.explorer.toggle, { desc = "Explorer (keep open)" } },
    { "<leader>o", config.explorer.focus, { desc = "Explorer (auto close)" } },
  },

  ---@type snacks.Config
  opts = {
    dashboard = { enabled = false },
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
