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
    local lsp_config = require "config.lsp"
    if not lsp_config.has_eslint_config() then return end
  end,
}
