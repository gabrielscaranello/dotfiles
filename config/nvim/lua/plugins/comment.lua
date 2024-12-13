return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  keys = {
    { "/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle comment for current line" },
    {
      "/",
      ":<C-u>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      desc = "Toggle comment for selection",
      mode = "v",
    },
  },
  opts = function()
    local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"

    return {
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}
