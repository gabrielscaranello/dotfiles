---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  version = "^v2",
  keys = require "plugins.snacks.keymaps",

  ---@return snacks.Config
  ---@param opts snacks.Config
  opts = function(_, opts)
    local picker = require "plugins.snacks.picker"
    local dashboard = require "plugins.snacks.dashboard"
    local extra = require "plugins.snacks.extra"

    return vim.tbl_extend("force", opts, dashboard, picker, extra)
  end,
}
