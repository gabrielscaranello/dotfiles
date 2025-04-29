return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type Snascks.Config
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

    picker = {
      sources = {
        explorer = { layout = { layout = { position = "right" } } },
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
