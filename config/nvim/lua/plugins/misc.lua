return {
  { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  { "b0o/SchemaStore.nvim", event = "VeryLazy" },
  { "echasnovski/mini.icons", event = "VeryLazy", version = "*" },
  { "folke/edgy.nvim", event = "VeryLazy", opts = {} },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "nvim-lua/plenary.nvim", event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  { "rlychrisg/keepcursor.nvim", event = "VeryLazy", opts = { enabled_on_start_v = "middle" } },
  { "stevearc/dressing.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
  { "stevearc/stickybuf.nvim", event = "VeryLazy", opts = {}, cmd = { "PinBuffer", "PinBuftype", "PinFiletype" } },
  { "wakatime/vim-wakatime", event = { "BufReadPre" } },
}
