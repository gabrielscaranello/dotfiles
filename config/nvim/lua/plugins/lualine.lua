return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  after = "catppuccin",
  opts = function()
    local lazy_status = require "lazy.status"
    local current_catpuccin_flavor = require("catppuccin").flavour
    local colors = require("catppuccin.palettes").get_palette(current_catpuccin_flavor)
    local components = require "config.lualine"
    local icons = require "utils.icons"

    return {
      options = {
        theme = "catppuccin",
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "snacks_dashboard" },
          winbar = { "snacks_picker_list" },
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(mode)
              return mode:upper()
            end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          { "branch", icon = icons.misc.branch },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 0,
            symbols = {
              modified = icons.misc.modified,
              readonly = icons.misc.readonly,
              unnamed = icons.misc.unnamed,
            },
          },
          { "diff", symbols = icons.git },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.peach },
          },
          { "filetype", icon_only = true },
          components.ai(colors),
          components.lsp(colors),
        },
        lualine_y = {
          { "progress" },
        },
        lualine_z = {
          { "location", icon = icons.misc.location },
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
      extensions = { "lazy", "fzf" },
    }
  end,
}
