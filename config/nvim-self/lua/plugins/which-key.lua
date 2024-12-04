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
    sort = { "group", "alphanum" },
  },

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)

    wk.add {
      { "<leader>\\", group = "+Split" },
      { "<leader>b", group = "+Buffer" },
      { "<leader>f", group = "+Find" },
      { "<leader>g", group = "+Git" },
      { "<leader>l", group = "+LSP", mode = { "n", "v" } },
      { "<leader>o", desc = "NeoTree Focus" },
      { "<leader>p", group = "+Package" },
      { "<leader>s", group = "+Search / Replace" },
      { "<leader>x", group = "+Trouble" },
    }
  end,
}
