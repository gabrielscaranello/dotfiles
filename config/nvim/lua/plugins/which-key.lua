---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  version = "^v3",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },

  ---@type wk.Opts
  opts = {
    preset = "modern",
    delay = function(ctx)
      return ctx.plugin and 0 or vim.o.timeoutlen
    end,
    notify = false,
    icons = { mappings = false },
    sort = { "group", "alphanum" },
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
  },

  config = function(_, opts)
    local ai = require "utils.ai"
    local wk = require "which-key"
    wk.setup(opts)

    wk.add {
      { "g", group = "Goto" },
      { "gx", desc = "Open file or URL under cursor" },
      { "<leader>\\", group = "+Split" },
      { "<leader>b", group = "+Buffer" },
      {
        "<leader>c",
        group = "+Codesnap / Multiple Cursors",
        mode = { "n", "x" },
      },
      { "<leader>d", desc = "+Spellcheck" },
      { "<leader>e", desc = "Explorer (keep open)" },
      { "<leader>f", group = "+Find" },
      { "<leader>h", group = "+Rest" },
      { "<leader>g", group = "+Git", mode = { "n", "v" } },
      { "<leader>l", group = "+LSP", mode = { "n", "v" } },
      { "<leader>o", desc = "Explorer (auto close)" },
      { "<leader>p", group = "+Package" },
      { "<leader>r", group = "+Search / Replace", mode = { "n", "v" } },
      { "<leader>s", group = "+Session" },
      { "<leader>t", group = "+Terminal" },
      { "<leader>x", group = "+Trouble" },
    }

    if ai.is_copilot_provider() then
      wk.add { "<leader>a", group = "+AI", mode = { "n", "v" } }
    end
  end,
}
