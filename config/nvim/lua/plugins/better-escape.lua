return {
  "max397574/better-escape.nvim",
  event = "VeryLazy",
  opts = {
    timeout = vim.o.timeoutlen,
    mappings = {
      v = { j = { k = false } },
      s = { j = { k = false } },
      t = {
        j = { k = false, j = false },
        k = { k = false, j = false },
      },
    },
    default_mappings = true,
  },
}
