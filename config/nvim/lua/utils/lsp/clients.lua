local ai = require "utils.ai"
local M = {}

---@type table<string>
local _ignoreds = {
  "copilot",
}

function M.restart_copilot()
  if not ai.copilot_lsp_is_active() then
    return
  end

  vim.cmd ":LspRestart copilot"
  vim.notify("Restarted Copilot LSP Client", vim.log.levels.INFO, { title = "LSP Clients" })
end

---@return vim.lsp.Client[]
function M.get_all_with_ignoreds()
  return vim.lsp.get_clients()
end

---@return vim.lsp.Client[]
function M.get_all()
  return vim.tbl_filter(
    ---@param v vim.lsp.Client
    function(v)
      return not vim.tbl_contains(_ignoreds, v.name)
    end,
    M.get_all_with_ignoreds()
  )
end

function M.restart()
  for _, client in pairs(M.get_all()) do
    vim.cmd(":LspRestart " .. client.name)
  end

  vim.notify("LSP Clients Restarted", vim.log.levels.INFO, { title = "LSP Clients" })
end

return M
