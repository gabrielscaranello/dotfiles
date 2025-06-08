---@type vim.lsp.Config
return {
  on_new_config = function(config)
    local schemas = config.settings.yaml.schemas or {}
    local schemastore = require("schemastore").yaml.schemas()
    local merged_schemas = vim.tbl_deep_extend("force", schemas, schemastore)
    config.settings.yaml.schemas = merged_schemas
  end,
  settings = { yaml = { schemaStore = { enable = false, url = "" } } },
}
