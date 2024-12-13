return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.opts.hl = "DashboardHeader"
    dashboard.section.header.val = {
      "                                                   Gabriel         ",
      "      ████ ██████           █████      ██       Scaranello   ",
      "     ███████████             █████                            ",
      "     █████████ ███████████████████ ███   ███████████  ",
      "    █████████  ███    █████████████ █████ ██████████████  ",
      "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
      " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
      "██████  █████████████████████ ████ █████ █████ ████ ██████",
    }

    dashboard.section.buttons.opts.hl = "DashboardShortCut"
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.opts.hl = "Comment"
    local total_plugins = require("lazy").stats().count
    local nvim_version = vim.version()
    local version_string = string.format("v%s.%s.%s", nvim_version.major, nvim_version.minor, nvim_version.patch)
    dashboard.section.footer.val = {
      string.format(" Neovim %s |  %d plugins | 󱓞 Enjoy coding!", version_string, total_plugins),
    }

    dashboard.config.opts.noautocmd = true
    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 3 },
      dashboard.section.footer,
    }

    return dashboard.opts
  end,

  config = function(_, opts) require("alpha").setup(opts) end,
}
