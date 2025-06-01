return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  keys = {
    { "/", "gcc", remap = true, desc = "Toggle comment for current line" },
    { "/", "gc", remap = true, desc = "Toggle comment for selection", mode = "v" },
    { "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", desc = "Add Comment Below" },
    { "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", desc = "Add Comment Above" },
  },
  opts = {},
}
