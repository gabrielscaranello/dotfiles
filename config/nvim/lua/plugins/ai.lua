return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cond = vim.g.ai.provider == "copilot",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = { markdown = true, help = true },
    },
  },

  {
    "fang2hou/blink-copilot",
    cond = vim.g.ai.provider == "copilot",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = { max_completions = 3, max_attempts = 2 },

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
              opts = { max_completions = 3, debounce = 200 },
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
    cond = vim.g.ai.provider == "codeium",
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

    config = function(_, opts) require("codeium").setup(opts) end,
  },
}
