---@type LazyPluginSpec[]
return {
  {
    "fang2hou/blink-copilot",
    cond = require("utils.ai").is_copilot_provider(),
    opts = { max_completions = 3, max_attempts = 2 },
    ft = require("utils.ai").get_supported_filetypes,
    keys = {
      {
        "<leader>ar",
        function()
          require("utils.lsp").clients.restart_copilot()
        end,
        desc = "Restart Copilot Client",
      },
    },

    specs = {
      "saghen/blink.cmp",
      ---@type blink.cmp.Config
      opts = {
        sources = {
          default = { "copilot" },
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              kind = "Copilot",
              score_offset = 100,
              async = true,
              opts = { max_completions = 3, debounce = 250, kind_hl = "BlinkCmpGhostText" },
            },
          },
        },
      },
    },
  },
}
