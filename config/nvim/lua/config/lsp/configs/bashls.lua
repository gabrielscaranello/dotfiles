return {
  on_attach = function(client)
    local filename = vim.fn.expand "%:t"
    if filename:match "^%.env" then return end

    if client.server_capabilities.documentSymbolProvider then vim.lsp.buf.document_symbol() end
  end,
}
