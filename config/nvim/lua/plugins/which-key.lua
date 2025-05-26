return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function() require("which-key").show { global = false } end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },

  ---@type wk.Opts
  opts = {
    preset = "modern",
    delay = function(ctx) return ctx.plugin and 0 or vim.o.timeoutlen end,
    notify = false,
    icons = { mappings = false },
    sort = { "group", "alphanum" },
    filter = function(mapping) return mapping.desc and mapping.desc ~= "" end,
  },

  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)

    wk.add {
      { "<leader>\\", group = "+Split" },
      { "<leader>b", group = "+Buffer" },
      { "<leader>c", group = "+Codesnap / Multiple Cursors", mode = { "n", "x" } },
      { "<leader>e", desc = "Explorer (keep open)" },
      { "<leader>f", group = "+Find" },
      { "<leader>h", group = "+Rest" },
      { "<leader>g", group = "+Git", mode = { "n", "v" } },
      { "<leader>l", group = "+LSP", mode = { "n", "v" } },
      { "<leader>o", desc = "Explorer (auto close)" },
      { "<leader>p", group = "+Package" },
      { "<leader>s", group = "+Search / Replace", mode = { "n", "v" } },
      { "<leader>t", group = "+Terminal" },
      { "<leader>x", group = "+Trouble" },
    }
  end,
}
