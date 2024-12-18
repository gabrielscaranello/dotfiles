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
  opts = {
    capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    },
    textDocument = {
      completion = {
        completionItem = {
          documentationFormat = { "markdown", "plaintext" },
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          deprecatedSupport = true,
          commitCharactersSupport = true,
          tagSupport = { valueSet = { 1 } },
          resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } },
        },
      },
    },
  },

  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    mason_lspconfig.setup_handlers {
      function(server_name)
        if server_name == "bufls" then server_name = "buf_ls" end

        lspconfig[server_name].setup { capabilities = capabilities }
      end,
      bashls = function()
        local config = lsp_setup.mkconfig("bashls", { capabilities = capabilities })
        lspconfig.bashls.setup(config)
      end,
      lua_ls = function()
        local config = lsp_setup.mkconfig("lua_ls", { capabilities = capabilities })
        lspconfig.lua_ls.setup(config)
      end,
      vtsls = function()
        local config = lsp_setup.mkconfig("vtsls", { capabilities = capabilities })
        lspconfig.vtsls.setup(config)
      end,
      html = function()
        local config = lsp_setup.mkconfig("html", { capabilities = capabilities })
        lspconfig.html.setup(config)
      end,
      jsonls = function()
        local config = lsp_setup.mkconfig("jsonls", { capabilities = capabilities })
        lspconfig.jsonls.setup(config)
      end,
      cssls = function()
        local config = lsp_setup.mkconfig("cssls", { capabilities = capabilities })
        lspconfig.cssls.setup(config)
      end,
      volar = function()
        local config = lsp_setup.mkconfig("volar", { capabilities = capabilities })
        lspconfig.volar.setup(config)
      end,
      yamlls = function()
        local config = lsp_setup.mkconfig("yamlls", { capabilities = capabilities })
        lspconfig.yamlls.setup(config)
      end,
      eslint = function()
        local config = lsp_setup.mkconfig("eslint", { capabilities = capabilities })
        lspconfig.eslint.setup(config)
      end,
    }
  end,
}
