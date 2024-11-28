return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
  },

  config = function()
    local keymap = require "utils.keymap"
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local function with_opts(opts)
          opts.buffer = event.buf
          opts.silent = opts.silent or true
          return opts
        end

        keymap.map {
          { "n", "gd", vim.lsp.buf.definition, with_opts { desc = "Goto Definition" } },
          { "n", "gr", vim.lsp.buf.references, with_opts { desc = "References", nowait = true } },
          { "n", "gI", vim.lsp.buf.implementation, with_opts { desc = "Goto Implementation" } },
          { "n", "gy", vim.lsp.buf.type_definition, with_opts { desc = "Goto T[y]pe Definition" } },
          { "n", "gD", vim.lsp.buf.declaration, with_opts { desc = "Goto Declaration" } },
          { "n", "K", function() return vim.lsp.buf.hover() end, with_opts { desc = "Hover" } },
          {
            "n",
            "gK",
            function() return vim.lsp.buf.signature_help() end,
            with_opts { desc = "Signature Help" },
          },
          {
            "i",
            "<c-k>",
            function() return vim.lsp.buf.signature_help() end,
            with_opts { desc = "Signature Help" },
          },
          {
            { "n", "v" },
            "<leader>la",
            vim.lsp.buf.code_action,
            with_opts { desc = "Code Action" },
          },
          { "n", "<leader>lr", vim.lsp.buf.rename, with_opts { desc = "Rename" } },
        }
      end,
    })

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
