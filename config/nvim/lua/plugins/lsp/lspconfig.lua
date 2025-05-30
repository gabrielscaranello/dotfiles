local lsp_setup = require "config.lsp"

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
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
    local automatic_enable_exclude = { "vue_ls" }
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
      table.insert(automatic_enable_exclude, server_name)
    end

    for server_name in pairs(lsp_setup.configs) do
      setup_lsp(server_name)
    end

    ---@diagnostic disable-next-line: missing-fields
    mason_lspconfig.setup {
      automatic_enable = { exclude = automatic_enable_exclude },
    }
  end,
}
