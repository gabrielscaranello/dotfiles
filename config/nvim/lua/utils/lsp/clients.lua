local M = {}

---@type table<string>
local _ignoreds = {
  "copilot",
}

---@return boolean
function M.copilot_lsp_active() return #(vim.lsp.get_clients { name = "copilot" }) > 0 end

---@return table<string>
M.get_ignoreds = function() return _ignoreds end

function M.restart_copilot()
  local copilot_ok, copilot = pcall(require, "copilot")
  if not copilot_ok or not copilot.setup_done then return end

  local copilot_cmd_ok, copilot_cmd = pcall(require, "copilot.command")
  if not copilot_cmd_ok then return end

  copilot_cmd.disable()
  copilot_cmd.enable()
end

---@return vim.lsp.Client[]
function M.get_all_with_ignoreds() return vim.lsp.get_clients() end

---@return vim.lsp.Client[]
function M.get_all()
  return vim.tbl_filter(
    --[[@param v vim.lsp.Client]]
    function(v) return not vim.tbl_contains(_ignoreds, v.name) end,
    M.get_all_with_ignoreds()
  )
end

function M.restart()
  local clients = M.get_all()

  for _, c in pairs(clients) do
    vim.lsp.stop_client(c.id, true)
    vim.lsp.start(c.config)
  end

  M.restart_copilot()
end

return M
