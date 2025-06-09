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
    lsp_stop_on_restore = true,
    suppressed_dirs = { "~/Code" },
    close_unsupported_windows = true,
  },

  keys = {
    { "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore last session" },
    { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save current session" },
    { "<leader>sd", "<cmd>SessionDelete<cr>", desc = "Delete Current Session" },
    { "<leader>st", "<cmd>SessionToggleAutoSave<cr>", desc = "Toggle Auto Save" },
    { "<leader>sl", "<cmd>SessionSearch<cr>", desc = "List Sessions" },
  },
}
