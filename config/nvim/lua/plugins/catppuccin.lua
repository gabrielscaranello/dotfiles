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
      dropbar = { enabled = true, color_mode = true },
      flash = true,
      gitsigns = true,
      illuminate = { enabled = true, lsp = false },
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      markdown = true,
      mini = { enabled = true, indentscope_color = "blue" },
      native_lsp = { enabled = true },
      neotree = true,
      noice = true,
      notify = true,
      nvim_surround = true,
      render_markdown = true,
      snacks = {
        enabled = true,
        indent_scope_color = "blue",
      },
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
