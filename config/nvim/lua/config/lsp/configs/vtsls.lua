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

---@return boolean
local function is_vue_project()
  local file_utils = require "utils.file"
  return file_utils.has_package_json_key "dependencies.vue"
end

---@param name string
---@return string | nil
local function load_npm_plugin(name)
  local npm_root_dir = vim.fn.trim(vim.fn.system "npm root -g")
  if not npm_root_dir or npm_root_dir == "" then
    return
  end

  local location = vim.fn.expand(npm_root_dir .. "/" .. name)
  if vim.fn.isdirectory(location) == 0 then
    return
  end

  return location
end

local function load_styled_plugin()
  local name = "@styled/typescript-styled-plugin"
  local location = load_npm_plugin(name)
  if location then
    return {
      name = name,
      location = location,
      configNamespace = "typescript",
      enableForWorkspaceTypeScriptVersions = true,
    }
  end
end

local function load_css_module_plugin()
  local name = "typescript-plugin-css-modules"
  local location = load_npm_plugin(name)
  if location then
    return {
      name = name,
      location = location,
      languages = { "css", "scss", "sass", "less", "styl" },
      enabled = false,
    }
  end
end

local load_vue_plugin = function()
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

local function load_global_plugins()
  local plugins = {}
  local load_plugin_handlers = {}

  if is_vue_project() then
    table.insert(load_plugin_handlers, load_vue_plugin)
  else
    table.insert(load_plugin_handlers, load_styled_plugin)
    table.insert(load_plugin_handlers, load_css_module_plugin)
  end

  for _, load_plugin in ipairs(load_plugin_handlers) do
    local plugin = load_plugin()
    if plugin then
      table.insert(plugins, plugin)
    end
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
    config.settings.vtsls.tsserver.globalPlugins = load_global_plugins()
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
