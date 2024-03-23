---@type LazySpec
return {
  "andythigpen/nvim-coverage",
  opts = { commands = true },
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
        if not vim.g.coverage_showing then coverage.load(false) end
        coverage.summary()
      end,
      desc = "Coverage Summary",
    },
  },
}
