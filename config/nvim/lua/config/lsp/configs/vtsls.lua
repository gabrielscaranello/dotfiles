local typescript_cfg = {
  updateImportsOnFileMove = "always",
  inlayHints = {
    parameterNames = { enabled = "all" },
    parameterTypes = { enabled = true },
    variableTypes = { enabled = true },
    propertyDeclarationTypes = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    enumMemberValues = { enabled = true },
  },
}

local function get_styled_plugin()
  local npm_root_dir = vim.fn.trim(vim.fn.system "npm root -g")
  if not npm_root_dir or npm_root_dir == "" then
    return
  end

  local location = vim.fn.expand(npm_root_dir .. "/@styled/typescript-styled-plugin")
  if vim.fn.isdirectory(location) == 0 then
    return
  end

  return {
    name = "@styled/typescript-styled-plugin",
    location = location,
    configNamespace = "typescript",
    enableForWorkspaceTypeScriptVersions = true,
  }
end

local get_vue_plugin = function()
  local registry_ok, registry = pcall(require, "mason-registry")
  if not registry_ok then
    return
  end

  if not registry.is_installed "vue-language-server" then
    return
  end

  return {
    name = "@vue/typescript-plugin",
    location = vim.fn.expand "$MASON/packages/vue-language-server/node_modules/@vue/language-server",
    languages = { "vue" },
    configNamespace = "typescript",
    enableForWorkspaceTypeScriptVersions = true,
  }
end

local function get_global_plugins()
  local plugins = {}

  local styled_plugin = get_styled_plugin()
  if styled_plugin then
    table.insert(plugins, styled_plugin)
  end

  local vue_plugin = get_vue_plugin()
  if vue_plugin then
    table.insert(plugins, vue_plugin)
  end

  return plugins
end

---@type vim.lsp.Config
return {
  filetypes = {
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "vue",
  },
  settings = {
    typescript = typescript_cfg,
    javascript = vim.tbl_deep_extend("force", typescript_cfg, {
      inlayHints = {
        parameterNames = { enabled = "literals" },
      },
    }),
    vtsls = {
      enableMoveToFileCodeAction = false,
      tsserver = { globalPlugins = {} },
    },
  },
  before_init = function(_, config)
    ---@diagnostic disable-next-line: undefined-field
    config.settings.vtsls.tsserver.globalPlugins = get_global_plugins()
  end,
  on_attach = function(client, bufnr)
    local ok, vtsls = pcall(require, "vtsls")
    if ok then
      local keymap = require "utils.keymap"
      local vtsls_config = require("vtsls.lspconfig").default_config
      client.config = vim.tbl_extend("force", vtsls_config, client.config)

      keymap.map {
        {
          "n",
          "gs",
          vtsls.commands.goto_source_definition,
          { desc = "Goto Source Definition (vtsls)" },
        },
      }

      return vtsls._on_attach(client.id, bufnr)
    end
  end,
}
