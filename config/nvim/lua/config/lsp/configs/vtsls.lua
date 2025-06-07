local typescript = {
  updateImportsOnFileMove = "always",
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
      enableMoveToFileCodeAction = false,
    },
  },
  on_attach = function(client, bufnr)
    local ok, vtsls = pcall(require, "vtsls")
    if ok then
      client.config = vim.tbl_extend("force", require("vtsls.lspconfig").default_config, client.config)
      return vtsls._on_attach(client.id, bufnr)
    end
  end,
}
