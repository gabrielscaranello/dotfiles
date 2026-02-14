---@type LazyPluginSpec[]
return {
  {
    "dmmulroy/tsc.nvim",
    version = "v2",
    cmd = "TSC",
    dependencies = { "folke/trouble.nvim" },
    keys = {
      { "<leader>lT", "<cmd>TSC<cr>", desc = "Run TSC" },
      { "<leader>lt", "<leader>xq", desc = "Toggle TSC ql", remap = true },
    },
    opts = {
      use_trouble_qflist = true,
      auto_open_qflist = false,
    },
  },
  { "yioneko/nvim-vtsls", opts = {}, config = function() end },
}
