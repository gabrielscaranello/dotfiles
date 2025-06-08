---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",

  ---@type CatppuccinOptions
  opts = {
    transparent_background = true,
    kitty = true,
    show_end_of_buffer = false,
    flavour = "mocha",
    integrations = {
      alpha = true,
      blink_cmp = true,
      flash = true,
      gitsigns = true,
      illuminate = { enabled = true, lsp = false },
      lsp_trouble = true,
      markdown = true,
      mini = { enabled = true, indentscope_color = "blue" },
      native_lsp = { enabled = true },
      noice = true,
      nvim_surround = true,
      render_markdown = true,
      snacks = {
        enabled = true,
        indent_scope_color = "blue",
      },
      treesitter = true,
      which_key = true,
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
