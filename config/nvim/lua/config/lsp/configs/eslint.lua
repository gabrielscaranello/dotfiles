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

  on_attach = function()
    local util = require "utils.lsp"
    if not util.eslint.exists() then
      return
    end
  end,
}
