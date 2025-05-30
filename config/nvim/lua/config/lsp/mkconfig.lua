local configs = require "config.lsp.configs"

---@return vim.lsp.Config
---@param server string
---@param opts vim.lsp.Config
return function(server, opts)
  local server_config = vim.deepcopy(configs[server] or {})
  local custom_config = vim.deepcopy(opts or {})
  local config = vim.tbl_deep_extend("force", server_config, custom_config)
  return config
end
