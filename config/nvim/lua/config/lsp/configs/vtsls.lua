local shared = require "config.lsp.configs._shared"

---@type vim.lsp.Config
return {
  settings = {
    typescript = shared.ts_js_settings,
    javascript = shared.ts_js_settings,
    vtsls = {
      enableMoveToFileCodeAction = true,
      tsserver = {
        globalPlugins = {},
      },
    },
  },
  before_init = function(_, config)
    local registry_ok, registry = pcall(require, "mason-registry")
    if not registry_ok then return end

    local vuels = registry.get_package "vue-language-server"

    if vuels:is_installed() then
      local volar_install_path = vim.fn.expand "$MASON/packages/vue-language-server/node_modules/@vue/language-server"

      local vue_plugin_config = {
        name = "@vue/typescript-plugin",
        location = volar_install_path,
        languages = { "vue" },
        configNamespace = "typescript",
        enableForWorkspaceTypeScriptVersions = true,
      }

      table.insert(config.settings.vtsls.tsserver.globalPlugins, { vue_plugin_config })
    end
  end,
}
