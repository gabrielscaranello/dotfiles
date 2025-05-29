local config = require "config.snacks"
local icons = require "utils.icons"

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  keys = {
    -- Explorer
    { "<leader>e", config.explorer.toggle, { desc = "Explorer (keep open)" } },
    { "<leader>o", config.explorer.focus, { desc = "Explorer (auto close)" } },

    -- Buffers and helps
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Tags" },
    { "<leader>fr", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notifications" },

    -- Diagnostics and LSP
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Document Symbols" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- Files
    { "<leader>f/", function() Snacks.picker.lines { layout = { preview = nil } } end, desc = "Grep (Current Buffer)" },
    { "<leader>fF", function() Snacks.picker.files { hidden = true } end, desc = "Find Files (hidden)" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fo", function() Snacks.picker.recent { filter = { cwd = true } } end, desc = "Find Recent Files" },
    { "<leader>fW", function() Snacks.picker.grep { hidden = true, noignore = true } end, desc = "Live Grep (hidden)" },
    { "<leader>fw", function() Snacks.picker.grep() end, desc = "Live Grep" },

    -- Git
    { "<leader>fg", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Commits" },
    { "<leader>gL", function() Snacks.picker.git_log_file() end, desc = "Git Commits (for current file)" },
    { "<leader>gt", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>fG", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Diff This" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Blame line" },
  },

  ---@type snacks.Config
  opts = {
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
      relative = "cursor",
      row = -3,
      col = 0,
    },
    explorer = { replace_netrw = true },
    picker = {
      sources = {
        git_branches = { all = true },
        explorer = {
          on_show = config.explorer.on_show,
          on_close = config.explorer.on_close,
          auto_close = true,
          layout = {
            preview = "main",
            hidden = { "preview", "input" },
            layout = { position = "right" },
          },
        },
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
  },
}
