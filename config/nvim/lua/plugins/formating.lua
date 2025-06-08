return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
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
        go = { "goimports", "gofmt", lsp_format = "last" },
        html = { "prettierd" },
        javascript = { "prettierd", lsp_format = "last" },
        javascriptreact = { "prettierd", lsp_format = "last" },
        json = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        postcss = { "prettierd" },
        proto = { "buf" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        typescript = { "prettierd", lsp_format = "last" },
        typescriptreact = { "prettierd", lsp_format = "last" },
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
