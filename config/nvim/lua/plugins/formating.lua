---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  cmd = "ConformInfo",
  version = "^v9.1",
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format()
      end,
      mode = { "n", "v" },
      desc = "Format File or Range (in visual mode)",
    },
  },

  opts = function()
    local utils = require "utils.formatters"

    ---@type conform.setupOpts
    return {
      formatters_by_ft = {
        ["yaml.docker-compose"] = { "prettierd" },
        css = { "prettierd" },
        go = { "goimports", "gofumpt" },
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
        sh = { "shellcheck", "shfmt" },
        typescript = { "prettierd", lsp_format = "first" },
        typescriptreact = { "prettierd", lsp_format = "first" },
        vue = { "prettierd", lsp_format = "first" },
        yaml = { "prettierd" },
      },

      format_on_save = {
        async = false,
        timeout_ms = 1000,
      },

      formatters = {
        prettierd = { condition = utils.prettier.conform_condition },
        prettier = { condition = utils.prettier.conform_condition },
      },

      filter = function(client)
        local ignored_clients = { "jsonls", "tsserver", "vtsls", "volar", "vue_ls" }

        for _, client_name in ipairs(ignored_clients) do
          if client_name == client.name then
            return false
          end
        end

        return true
      end,
    }
  end,
}
