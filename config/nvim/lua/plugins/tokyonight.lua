return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  version = "^v4.13",
  ---@type tokyonight.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    cache = true,
    lualine_bold = true,
    style = "moon",
    terminal_colors = true,
    transparent = true,
    plugins = { auto = true },
    styles = { floats = "transparent", sidebars = "transparent" },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme "tokyonight"
  end,
}
