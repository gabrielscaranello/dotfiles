---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      completion = { callSnippet = "Replace" },
      hint = {
        enable = false,
        arrayIndex = "Auto",
        await = true,
        paramName = "All",
        paramType = true,
        semicolon = "SameLine",
        setType = false,
      },
    },
  },
}
