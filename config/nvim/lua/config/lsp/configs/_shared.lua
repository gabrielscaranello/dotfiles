local M = {}

M.ts_js_settings = {
  updateImportsOnFileMove = { enabled = "always" },
  format = { enable = false },
  inlayHints = {
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = true,
    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  },
}

M.volar_ts_js_settings = {
  format = { enable = false },
  inlayHints = {
    enumMemberValues = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    parameterTypes = { enabled = true, suppressWhenArgumentMatchesName = true },
    propertyDeclarationTypes = { enabled = true },
    variableTypes = { enabled = true },
  },
}

return M
