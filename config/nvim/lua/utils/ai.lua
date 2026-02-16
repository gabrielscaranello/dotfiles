local M = {}

---@return 'copilot' | 'codeium' | nil
function M.get_provider()
  return vim.env.AI_PROVIDER or nil
end

---@return boolean
function M.is_copilot_provider()
  return M.get_provider() == "copilot"
end

---@return boolean
function M.is_windsurf_provider()
  return M.get_provider() == "codeium"
end

---@return boolean
function M.copilot_lsp_is_active()
  return #(vim.lsp.get_clients { name = "copilot" }) > 0
end

return M
