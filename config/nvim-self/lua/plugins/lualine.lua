return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  after = "catppuccin",
  opts = function()
    local lazy_status = require "lazy.status"
    local current_catpuccin_flavor = require("catppuccin").flavour
    local colors = require("catppuccin.palettes").get_palette(current_catpuccin_flavor)
    local components = require "config.lualine"

    return {
      options = {
        theme = "catppuccin",
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "alpha" },
          winbar = { "neo-tree" },
        },
      },
      sections = {
        lualine_a = {

          {
            "mode",
            fmt = function(mode) return mode:upper() end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          { "branch", icon = "" },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.peach },
          },
          { "filetype", icon_only = true },
          components.lsp(colors),
        },
        lualine_y = {
          { "progress" },
        },
        lualine_z = {
          { "location", icon = "" },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }
  end,
}
