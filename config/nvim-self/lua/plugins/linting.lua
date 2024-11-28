return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      lua = { "luacheck" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
  },
  keys = {
    {
      "<leader>ll",
      function() require("lint").try_lint() end,
      desc = "Trigger Linting for current file",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("Linter", { clear = true }),
      callback = function() require("lint").try_lint() end,
    })
  end,

  config = function(_, opts) require("lint").linters_by_ft = opts.linters_by_ft end,
}
