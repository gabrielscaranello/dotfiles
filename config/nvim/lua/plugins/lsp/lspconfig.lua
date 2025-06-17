local lsp_setup = require "config.lsp"

---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  version = "^v2.3.0",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "Saghen/blink.cmp",
  },
  opts = {
    ---@type lsp.ClientCapabilities
    capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
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
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits" },
            },
          },
        },
      },
    },
  },

  config = function(_, opts)
    local cmp_nvim_lsp = require "blink-cmp"
    local mason_lspconfig = require "mason-lspconfig"

    local installed_servers = mason_lspconfig.get_installed_servers()
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.get_lsp_capabilities() or {},
      opts.capabilities or {}
    )

    for _, server_name in ipairs(installed_servers) do
      local default = { capabilities = capabilities }
      local config = lsp_setup.mkconfig(server_name, default)
      vim.lsp.config[server_name] = config
    end

    vim.lsp.enable(installed_servers)
  end,
}
