---@type vim.lsp.Config
return {
  filetypes = { "yaml", "yaml.docker-compose", "yaml.snyk" },
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
