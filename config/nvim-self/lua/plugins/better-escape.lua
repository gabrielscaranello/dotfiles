return {
  "max397574/better-escape.nvim",
  event = "VeryLazy",
  opts = {
    timeout = vim.o.timeoutlen,
    mappings = {
      v = { j = { k = false } },
      s = { j = { k = false } },
    },
    default_mappings = true,
  },
}
