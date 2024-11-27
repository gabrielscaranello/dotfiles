return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  opts = {
    transparent_background = true,
    integrations = {
      alpha = true,
      cmp = true,
      neotree = true,
      which_key = true,
      treesitter = true,
      snacks = true,
      mini = true,
      telescope = { enabled = true },
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
