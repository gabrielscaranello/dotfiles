local lsp = require "utils.lsp.clients"
local ai = require "utils.ai"

local M = {}

function M.refresh_gitsign()
  local ok, gs = pcall(require, "gitsigns")
  if ok then
    gs.refresh()
  end
end

function M.refresh_buffer()
  vim.cmd "e!"
end

function M.refresh_all_buffers()
  local current_buf = vim.api.nvim_get_current_buf()
  vim.cmd "bufdo e!"
  vim.api.nvim_set_current_buf(current_buf)
end

function M.restart_lsp()
  lsp.restart()
end

function M.restart_copilot()
  lsp.restart_copilot()
end

function M.restart_windsurf()
  if ai.is_windsurf_provider() then
    require("lazy").reload { plugins = { "windsurf.nvim" } }
  end
end

function M.refresh_neovim()
  M.refresh_gitsign()
  M.refresh_buffer()
  M.refresh_all_buffers()
  M.restart_lsp()
  M.restart_copilot()
  M.restart_windsurf()
end

return M
