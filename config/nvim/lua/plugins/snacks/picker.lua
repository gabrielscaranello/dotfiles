---@return snacks.Config
local function picker()
  local default_icons = require("snacks.picker.config.defaults").defaults.icons
  local config = require "config.snacks"
  local icons = require "utils.icons"

  ---@type snacks.Config
  return {
    picker = {
      ui_select = true,
      icons = vim.tbl_extend("force", default_icons, {
        diagnostics = icons.diagnostics,
        git = icons.git,
        kinds = icons.kinds,
      }),
      win = {
        input = {
          keys = {
            ["<C-p>"] = { "history_back", mode = { "i", "n" } },
            ["<C-n>"] = { "history_forward", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["copy_options"] = { "<C-y>", config.explorer.copy_actions, desc = "copy_options" },
          },
        },
      },
      sources = {
        git_branches = { all = true },
        explorer = {
          on_show = config.explorer.on_show,
          on_close = config.explorer.on_close,
          auto_close = true,
          layout = {
            preview = "main",
            hidden = { "preview" },
            layout = { position = "right", resize = true },
          },
        },
      },
    },
  }
end

return picker()
