return {
  "Exafunction/windsurf.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },

  opts = {
    enable_cmp_source = true,
    enable_chat = false,
    virtual_text = {
      enabled = false,
    },
    workspace_root = {
      use_lsp = true,
      find_root = nil,
      paths = {
        ".git",
        "package.json",
      },
    },
  },

  config = function(_, opts) require("codeium").setup(opts) end,
}
