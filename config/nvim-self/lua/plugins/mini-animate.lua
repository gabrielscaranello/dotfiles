return {
  "echasnovski/mini.animate",
  version = "*",
  event = "VeryLazy",
  opts = function()
    local animate = require "mini.animate"
    return {
      open = { enable = false },
      close = { enable = false },
      resize = { enable = false },
      scroll = {
        timing = animate.gen_timing.linear { duration = 150, unit = "total" },
        subscroll = animate.gen_subscroll.equal {
          predicate = function(total_scroll) return total_scroll > 1 end,
        },
      },
      cursor = {
        timing = animate.gen_timing.linear { duration = 80, unit = "total" },
      },
    }
  end,
  config = function(_, opts) require("mini.animate").setup(opts) end,
}
