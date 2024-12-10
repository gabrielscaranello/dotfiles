return {
  { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  { "echasnovski/mini.icons", event = "VeryLazy", version = "*" },
  { "folke/edgy.nvim", event = "VeryLazy", opts = {} },
  { "junegunn/vim-easy-align", event = "VeryLazy" },
  { "nvim-lua/plenary.nvim", event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  { "stevearc/dressing.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
  { "stevearc/stickybuf.nvim", event = "VeryLazy", opts = {}, cmd = { "PinBuffer", "PinBuftype", "PinFiletype" } },
  { "wakatime/vim-wakatime", event = { "BufReadPre" } },
}
