return {
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  event = "VeryLazy",
  keys = function()
    local dropbar_api = require "dropbar.api"

    return {
      { "<leader>;", dropbar_api.pick, desc = "Pick symbols in winbar" },
      { "[;", dropbar_api.goto_context_start, desc = "Go to start of current context" },
      { "];", dropbar_api.select_next_context, desc = "Select next context" },
    }
  end,
  opts = function()
    local icons = require "utils.icons"

    return {
      icons = {
        kinds = icons.kinds,
        ui = {
          bar = { separator = "  " },
          menu = { separator = " ", indicator = " " },
        },
      },
      bar = {
        padding = { left = 3, right = 1 },
      },
      menu = {
        preview = false,
        quick_navigation = true,
        entry = {
          padding = { left = 1, right = 1 },
          prefix = " ",
        },
        scrollbar = {
          enable = false,
        },
      },
    }
  end,
}
