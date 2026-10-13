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

  on_attach = function(client)
    local util = require "utils.lsp"
    if not util.eslint.exists() then
      client.stop()
      return
    end
  end,
}
