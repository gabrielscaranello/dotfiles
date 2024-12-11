return {
  "echasnovski/mini.animate",
  version = "*",
  event = "VeryLazy",
  opts = function()
    local animate = require "mini.animate"

    local mouse_scrolled = false
    for _, scroll in ipairs { "Up", "Down" } do
      local key = "<ScrollWheel" .. scroll .. ">"
      vim.keymap.set({ "", "i" }, key, function()
        mouse_scrolled = true
        return key
      end, { expr = true })
    end

    return {
      open = { enable = false },
      close = { enable = false },
      resize = { enable = false },
      scroll = {
        timing = animate.gen_timing.linear { duration = 150, unit = "total" },
        subscroll = animate.gen_subscroll.equal {
          predicate = function(total_scroll)
            if not mouse_scrolled then
              mouse_scrolled = false
              return false
            end
            return total_scroll > 1
          end,
        },
      },
      cursor = {
        timing = animate.gen_timing.linear { duration = 80, unit = "total" },
      },
    }
  end,
  config = function(_, opts) require("mini.animate").setup(opts) end,
}
