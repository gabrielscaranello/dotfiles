local lsp_setup = require "config.lsp"

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    { "williamboman/mason-lspconfig.nvim", config = function() end },
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    "stevearc/dressing.nvim",
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
      lua_ls = function()
        local opts = lsp_setup.mkconfig("lua_ls", { capabilities = capabilities })
        lspconfig.lua_ls.setup(opts)
      end,
      vtsls = function()
        local opts = lsp_setup.mkconfig("vtsls", { capabilities = capabilities })
        lspconfig.vtsls.setup(opts)
      end,
      html = function()
        local opts = lsp_setup.mkconfig("html", { capabilities = capabilities })
        lspconfig.html.setup(opts)
      end,
      jsonls = function()
        local opts = lsp_setup.mkconfig("jsonls", { capabilities = capabilities })
        lspconfig.jsonls.setup(opts)
      end,
      cssls = function()
        local opts = lsp_setup.mkconfig("cssls", { capabilities = capabilities })
        lspconfig.cssls.setup(opts)
      end,
      volar = function()
        local opts = lsp_setup.mkconfig("volar", { capabilities = capabilities })
        lspconfig.volar.setup(opts)
      end,
      eslint = function()
        local opts = lsp_setup.mkconfig("eslint", { capabilities = capabilities })
        lspconfig.eslint.setup(opts)
      end,
    }
  end,
}
