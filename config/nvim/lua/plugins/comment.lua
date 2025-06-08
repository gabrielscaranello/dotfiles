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
      function()
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.blockwise(vim.fn.visualmode())
      end,
      desc = "Toggle comment for selection",
      mode = "v",
    },
  },
  opts = function()
    local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"

    return { pre_hook = ts_context_commentstring.create_pre_hook() }
  end,
}
