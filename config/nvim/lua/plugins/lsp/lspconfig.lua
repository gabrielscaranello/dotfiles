local lsp_setup = require "config.lsp"

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
    "hrsh7th/cmp-nvim-lsp",
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
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    local enable_servers = {} ---@type table<string>
    local function configure_server(server_name)
      local config = lsp_setup.mkconfig(server_name, { capabilities = capabilities })
      vim.lsp.config[server_name] = config
      table.insert(enable_servers, server_name)
    end

    for server_name in pairs(lsp_setup.configs) do
      configure_server(server_name)
    end

    vim.lsp.enable(enable_servers)
  end,
}
