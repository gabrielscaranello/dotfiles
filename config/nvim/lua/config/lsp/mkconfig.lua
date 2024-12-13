local configs = require "config.lsp.configs"

return function(server, opts)
  local config = configs[server]
  return vim.tbl_deep_extend("force", config or {}, opts or {})
end
