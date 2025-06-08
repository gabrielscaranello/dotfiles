return {
  "andythigpen/nvim-coverage",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    auto_reload = true,
    commands = true,
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>lc",
      function()
        local coverage = require "coverage"

        if vim.g.coverage_showing then
          coverage.hide()
        else
          coverage.load(true)
          coverage.show()
        end

        vim.g.coverage_showing = not vim.g.coverage_showing
      end,
      desc = "Coverage",
    },
    {
      "<leader>lC",
      function()
        local coverage = require "coverage"
        if not vim.g.coverage_showing then
          coverage.load(false)
        end
        coverage.summary()
      end,
      desc = "Coverage Summary",
    },
  },
}
