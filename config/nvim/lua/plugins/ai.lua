local ai = require "utils.ai"

---@type LazyPluginSpec[]
return {
  -- Copilot
  {
    "fang2hou/blink-copilot",
    cond = ai.is_copilot_provider,
    opts = { max_completions = 3, max_attempts = 2 },
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

  -- Codeium/Windsurf
  {
    "Exafunction/windsurf.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cond = ai.is_windsurf_provider,
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
      enable_cmp_source = true,
      enable_chat = false,
      virtual_text = { enabled = false },
      workspace_root = {
        use_lsp = true,
        find_root = nil,
        paths = { ".git", "package.json" },
      },
    },

    specs = {
      "saghen/blink.cmp",
      opts = {
        sources = {
          default = { "codeium" },
          providers = {
            codeium = {
              name = "Codeium",
              module = "codeium.blink",
              kind = "Codeium",
              score_offset = 100,
              max_items = 3,
              async = true,
            },
          },
        },
      },
    },

    config = function(_, opts)
      require("codeium").setup(opts)
    end,
  },
}
