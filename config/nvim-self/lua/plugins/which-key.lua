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
  opts = {
    notify = false,
    icons = { mappings = false },
  },

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)

    wk.add {
      { "<leader>b", group = "+Buffer" },
      { "<leader>s", group = "+Split" },
      { "<leader>f", group = "+Find" },
      { "<leader>g", group = "+Git" },
      { "<leader>o", desc = "NeoTree Focus" },
      { "<leader>p", group = "+Package" },
    }
  end,
}