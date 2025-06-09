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
      blink_cmp = { style = "bordered" },
      flash = true,
      gitsigns = { enabled = true, transparent = true },
      grug_far = true,
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = { enabled = true, indentscope_color = "blue" },
      native_lsp = { enabled = true },
      noice = true,
      render_markdown = true,
      snacks = { enabled = true, indent_scope_color = "blue" },
      treesitter = true,
      which_key = true,
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
