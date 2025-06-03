local prettier_condition = function(_, ctx)
  local patterns = { "%.mdx?$", "%.ya?ml$", "%.json$" }

  for _, pattern in pairs(patterns) do
    if ctx.filename:match(pattern) then return true end
  end

  local formatters_config = require "config.formatters"
  return formatters_config.has_prettier_config()
end

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>lf",
      function() require("conform").format() end,
      mode = { "n", "v" },
      desc = "Format File or Range (in visual mode)",
    },
  },

  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      ["yaml.docker-compose"] = { "prettierd" },
      css = { "prettierd" },
      go = { "goimports", "gofmt", lsp_format = "last" },
      html = { "prettierd" },
      javascript = { "prettierd", lsp_format = "first" },
      javascriptreact = { "prettierd", lsp_format = "first" },
      json = { "prettierd" },
      less = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      postcss = { "prettierd" },
      proto = { "buf" },
      scss = { "prettierd" },
      sh = { "shfmt" },
      typescript = { "prettierd", lsp_format = "first" },
      typescriptreact = { "prettierd", lsp_format = "first" },
      vue = { "prettierd", lsp_format = "first" },
      yaml = { "prettierd" },
    },

    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },

    formatters = {
      prettierd = { condition = prettier_condition },
      prettier = { condition = prettier_condition },
    },

    filter = function(client)
      local ignored_clients = { "jsonls", "tsserver", "vtsls", "volar" }

      for _, client_name in ipairs(ignored_clients) do
        if client_name == client.name then return false end
      end

      return true
    end,
  },
}
