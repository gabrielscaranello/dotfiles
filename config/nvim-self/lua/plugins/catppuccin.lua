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
      gitsigns = true,
      indent_blankline = { enabled = true },
      markdown = true,
      mini = { enabled = true, indentscope_color = "blue" },
      native_lsp = { enabled = true },
      neotree = true,
      noice = true,
      notify = true,
      nvim_surround = true,
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
