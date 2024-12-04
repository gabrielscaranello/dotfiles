return {
  { "nvim-lua/plenary.nvim", event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  { "echasnovski/mini.icons", event = "VeryLazy", version = "*" },
  { "wakatime/vim-wakatime", event = { "BufReadPre" } },
  { "stevearc/dressing.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
  { "folke/edgy.nvim", event = "VeryLazy", opts = {} },
}
