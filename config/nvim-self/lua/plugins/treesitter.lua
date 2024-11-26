local ensure_installed = {
  "lua",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  version = false,
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = ensure_installed,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },

  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
