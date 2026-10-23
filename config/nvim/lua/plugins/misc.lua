---@type LazyPluginSpec[]
return {
  { "b0o/SchemaStore.nvim", lazy = true, version = false },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  {
    "wakatime/vim-wakatime",
    event = { "BufReadPre" },
    enabled = vim.env.WAKATIME_ENABLED == "true",
  },
}
