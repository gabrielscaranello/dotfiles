---@return snacks.Config
local function extra()
  local icons = require "utils.icons"

  ---@type snacks.Config
  return {
    bigfile = { enabled = true },
    explorer = { replace_netrw = true },
    indent = {
      enabled = true,
      animate = {
        style = "out",
        easing = "linear",
        duration = { step = 30, total = 400 },
      },
    },
    input = {
      enabled = true,
      ui_select = true,
      expand = true,
      win = {
        relative = "cursor",
        row = 1,
        col = 0,
      },
    },
    notifier = {
      enabled = true,
      style = "compact",
      top_down = false,
      timeout = 2500,
      level = vim.log.levels.TRACE,
      icons = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        debug = icons.misc.debug,
        trace = icons.misc.trace,
      },
    },
    quickfile = { enabled = true },
    scroll = {
      enabled = true,
      filter = function(buf)
        return vim.g.snacks_scroll ~= false
          and vim.b[buf].snacks_scroll ~= false
          and vim.bo[buf].buftype ~= "terminal"
          and vim.bo[buf].filetype ~= "blink-cmp-menu"
      end,
    },
    words = { enabled = true, debounce = 200, notify_jump = true },
  }
end

return extra()
