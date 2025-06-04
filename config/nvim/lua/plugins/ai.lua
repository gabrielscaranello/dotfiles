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
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    event = "VeryLazy",
    cond = vim.g.ai.provider == "copilot" or vim.g.ai.use_copilot_chat,
    cmd = "CopilotChat",
    dependencies = {
      "github/copilot.lua",
      "nvim-lua/plenary.nvim",
      {
        "folke/edgy.nvim",
        optional = true,
        opts = function(_, opts)
          opts.right = opts.right or {}
          table.insert(opts.right, {
            ft = "copilot-chat",
            title = "Copilot Chat",
            size = { width = 50 },
          })
        end,
      },
    },
    opts = function()
      local user = vim.env.USER or "User"
      return {
        auto_insert_mode = true,
        question_header = " " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
      }
    end,

    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      { "<leader>a", "", desc = "+AI", mode = { "n", "v" } },
      {
        "<leader>aa",
        function() require("CopilotChat").toggle() end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function() require("CopilotChat").reset() end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          local opts = { prompt = "Quick Chat: " }
          local cb = function(input)
            if input ~= "" then require("CopilotChat").ask(input) end
          end
          vim.ui.input(opts, cb)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function() require("CopilotChat").select_prompt() end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
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
