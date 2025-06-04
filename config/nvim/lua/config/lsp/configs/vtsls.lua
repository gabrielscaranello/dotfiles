local typescript = {
  updateImportsOnFileMove = { enabled = "always" },
  inlayHints = {
    parameterNames = { enabled = "all" },
    parameterTypes = { enabled = true },
    variableTypes = { enabled = true },
    propertyDeclarationTypes = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    enumMemberValues = { enabled = true },
  },
}

---@type vim.lsp.Config
return {
  settings = {
    typescript = typescript,
    javascript = vim.tbl_deep_extend("force", typescript, {
      inlayHints = {
        parameterNames = { enabled = "literals" },
      },
    }),
    vtsls = {
      enableMoveToFileCodeAction = true,
    },
  },
}
