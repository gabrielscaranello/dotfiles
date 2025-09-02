---@type LazyPluginSpec
return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_save = true,
    enabled = true,
    lazy_support = true,
    auto_restore = false,
    auto_restore_last_session = false,
    git_use_branch_name = true,
    git_auto_restore_on_branch_change = true,
    show_auto_restore_notif = false,
    lsp_stop_on_restore = false,
    suppressed_dirs = { "~/Code" },
    close_unsupported_windows = true,
    post_restore_cmds = { "silent !kill -s SIGWINCH $PPID" },
  },

  keys = {
    { "<leader>sr", "<cmd>AutoSession restore<cr>", desc = "Restore last session" },
    { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save current session" },
    { "<leader>sd", "<cmd>AutoSession delete<cr>", desc = "Delete Current Session" },
    { "<leader>st", "<cmd>AutoSession toggle<cr>", desc = "Toggle Auto Save" },
    { "<leader>sl", "<cmd>AutoSession search<cr>", desc = "List Sessions" },
  },
}
