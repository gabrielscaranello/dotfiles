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
      markdown = true,
      mini = true,
      neotree = true,
      noice = true,
      snacks = true,
      telescope = { enabled = true },
      treesitter = true,
      which_key = true,
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
