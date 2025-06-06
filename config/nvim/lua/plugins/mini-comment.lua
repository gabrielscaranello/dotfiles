return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = true },
  },
  keys = {
    { "/", "gcc", remap = true, desc = "Toggle comment for current line" },
    { "/", "gc", remap = true, desc = "Toggle comment for selection", mode = "v" },
    { "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", desc = "Add Comment Below" },
    { "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", desc = "Add Comment Above" },
  },
  opts = {
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
}
