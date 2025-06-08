local ensure_installed = {
  -- bash
  "bash-debug-adapter",
  "bash-language-server",
  "shellcheck",
  "shfmt",

  -- Docker
  "docker-compose-language-service",
  "dockerfile-language-server",
  "hadolint",

  -- Go
  "delve",
  "goimports",
  "gomodifytags",
  "gopls",
  "gotests",
  "iferr",
  "impl",

  -- GraphQL
  "graphql-language-service-cli",

  -- Json
  "json-lsp",

  -- Markdown
  "marksman",

  -- HTML/JSX/TSX/TS/JS
  "css-lsp",
  "emmet-ls",
  "eslint-lsp",
  "html-lsp",
  "prettierd",
  "vue-language-server",
  "vtsls",

  -- Lua
  "lua-language-server",
  "luacheck",
  "stylua",

  -- Prisma
  "prisma-language-server",

  -- Proto
  "buf",
  "pbls",

  -- Yaml
  "yaml-language-server",
}

return {
  "mason-org/mason.nvim",
  cmd = { "Mason" },
  build = ":MasonUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = ensure_installed,
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "󰑓",
        package_uninstalled = "✗",
      },
    },
  },

  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local mason_registry = require "mason-registry"

    mason_registry:on("package:install:success", function()
      vim.defer_fn(function()
        require("lazy.core.handler.event").trigger {
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        }
      end, 100)
    end)

    mason_registry.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mason_registry.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
