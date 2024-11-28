local lsp_setup = require "config.lsp"

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
  },
  init = function() lsp_setup.create_autocmd() end,
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local sings = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

    for type, icon in pairs(sings) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    mason_lspconfig.setup_handlers {
      function(server_name) lspconfig[server_name].setup { capabilities = capabilities } end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        }
      end,
    }
  end,
}
