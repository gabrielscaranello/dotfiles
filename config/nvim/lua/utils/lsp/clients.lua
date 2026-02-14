local M = {}

---@type table<string>
local _ignoreds = {
  "copilot",
}

---@return boolean
function M.copilot_lsp_active()
  return #(vim.lsp.get_clients { name = "copilot" }) > 0
end

function M.restart_copilot()
  local copilot_ok, copilot = pcall(require, "copilot")
  if not copilot_ok or not copilot.setup_done then
    return
  end

  local copilot_cmd_ok, copilot_cmd = pcall(require, "copilot.command")
  if not copilot_cmd_ok then
    return
  end

  copilot_cmd.disable()
  copilot_cmd.enable()
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

  M.restart_copilot()
end

return M
