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

  opts = {
    formatters_by_ft = {
      ["yaml.docker-compose"] = { "prettierd" },
      css = { "prettierd" },
      go = { "goimports", lsp_format = "last" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      less = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      postcss = { "prettierd" },
      scss = { "prettierd" },
      sh = { "shfmt" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      vue = { "prettierd" },
      yaml = { "prettierd" },
    },

    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
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