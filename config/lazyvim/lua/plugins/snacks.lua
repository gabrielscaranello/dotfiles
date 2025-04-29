---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    dashboard = {
      preset = {
        header = table.concat({
          "                                                   Gabriel         ",
          "      ████ ██████           █████      ██       Scaranello   ",
          "     ███████████             █████                            ",
          "     █████████ ███████████████████ ███   ███████████  ",
          "    █████████  ███    █████████████ █████ ██████████████  ",
          "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
          " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
          "██████  █████████████████████ ████ █████ █████ ████ ██████",
        }, "\n"),
      },
    },

    indent = {
      only_scope = true,
      scope = { enabled = true },
      chuck = { enabled = true },
      animate = {
        enabled = true,
        style = "down",
        easing = "linear",
        duration = {
          step = 30,
          total = 500,
        },
      },
    },

    notifier = {
      top_down = false,
      style = "compact",
    },

    input = { enabled = true },
    select = { enabled = true },
  },
}
