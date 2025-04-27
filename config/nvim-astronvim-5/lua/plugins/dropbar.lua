return {
  "Bekaboo/dropbar.nvim",
  event = "UIEnter",
  keys = function()
    local dropbar_api = require "dropbar.api"

    return {
      { "<leader>;", dropbar_api.pick, desc = "Pick symbols in winbar" },
      { "[;", dropbar_api.goto_context_start, desc = "Go to start of current context" },
      { "];", dropbar_api.select_next_context, desc = "Select next context" },
    }
  end,
  opts = function()
    ---@type dropbar_configs_t
    return {
      icons = {
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
