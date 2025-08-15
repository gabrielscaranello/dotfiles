---@return snacks.Config
local function dashboard()
  local footer_text = function()
    local total_plugins = require("lazy").stats().count
    local nvim_version = vim.version()
    local version_string =
      string.format("v%s.%s.%s", nvim_version.major, nvim_version.minor, nvim_version.patch)
    return string.format(
      " Neovim %s |  %d plugins | 󱓞 Enjoy coding!",
      version_string,
      total_plugins
    )
  end

  ---@type snacks.Config
  return {
    dashboard = {
      enabled = true,
      width = 50,
      row = 5,
      preset = {
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            icon = " ",
            key = "n",
            desc = "New File",
            action = ":ene | startinsert",
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = ":lua Snacks.dashboard.pick('oldfiles', { filter = { cwd = true } })",
          },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            action = ":SessionRestore",
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },

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

      sections = {
        { section = "header", padding = { 5, 0 } },
        { section = "keys", gap = 1, padding = 1 },
        {
          text = { { footer_text(), hl = "Conceal" } },
          align = "center",
          padding = { 0, 3 },
        },
      },
    },
  }
end

return dashboard()
