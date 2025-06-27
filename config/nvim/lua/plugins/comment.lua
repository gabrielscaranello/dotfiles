---@type LazyPluginSpec
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  keys = {
    {
      "/",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      desc = "Toggle comment for current line",
    },
    {
      "/",
      ":<C-u>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      desc = "Toggle comment for selection",
      mode = "v",
    },
  },
  opts = {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  },
}
