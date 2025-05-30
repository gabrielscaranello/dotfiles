---@type vim.lsp.Config
return {
  on_attach = function(client)
    local filename = vim.fn.expand "%:t"
    if filename:match "^%.env" then return end
  end,
}
