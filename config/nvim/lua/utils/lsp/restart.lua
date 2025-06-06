local M = {}

M.unrestartable = {
  "copilot",
}

function M.copilot()
  local copilot_ok, copilot = pcall(require, "copilot")
  if not copilot_ok or not copilot.setup_done then return end

  local copilot_cmd_ok, copilot_cmd = pcall(require, "copilot.command")
  if not copilot_cmd_ok then return end

  copilot_cmd.disable()
  copilot_cmd.enable()
end

function M.lsp_clients()
  local clients = vim.tbl_filter(
    --[[@param v vim.lsp.Client]]
    function(v) return not vim.tbl_contains(M.unrestartable, v.name) end,
    vim.lsp.get_clients()
  )

  for _, c in pairs(clients) do
    vim.lsp.stop_client(c.id, true)
    vim.lsp.start(c.config)
  end

  M.copilot()
end

return M
