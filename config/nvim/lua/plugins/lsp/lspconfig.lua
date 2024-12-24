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

    local function setup_lsp(server_name)
      local config = lsp_setup.mkconfig(server_name, { capabilities = capabilities })
      lspconfig[server_name].setup(config)
    end

    local custom_handlers = {
      bashls = true,
      buf_ls = true,
      clangd = true,
      cssls = true,
      eslint = true,
      html = true,
      jsonls = true,
      lua_ls = true,
      pbls = true,
      volar = true,
      vtsls = true,
      yamlls = true,
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        if custom_handlers[server_name] then
          setup_lsp(server_name)
        else
          lspconfig[server_name].setup { capabilities = capabilities }
        end
      end,
    }
  end,
}
