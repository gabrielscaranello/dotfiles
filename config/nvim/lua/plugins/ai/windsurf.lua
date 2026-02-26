---@type LazyPluginSpec
return {
  "Exafunction/windsurf.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cond = require("utils.ai").is_windsurf_provider(),
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

  keys = {
    {
      "<leader>uw",
      function()
        require("utils.refresh").restart_windsurf()
      end,
      desc = "Restart windsurf",
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
            enabled = function()
              local ai = require "utils.ai"
              local filetypes = ai.get_supported_filetypes()
              local filetype = vim.bo.filetype
              return vim.tbl_contains(filetypes, filetype)
            end,
          },
        },
      },
    },
  },

  config = function(_, opts)
    require("codeium").setup(opts)
  end,
}
