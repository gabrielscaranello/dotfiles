local explorer_is_open = false
local M = {
  -- Snacks explorer custom functions
  explorer = {},
}

-- Define a more specific type for the options
---@class ExplorerToggleOpts
---@field auto_close? boolean

-- Toggle the explorer
---@param opts? ExplorerToggleOpts
function M.explorer.toggle(opts)
  local default_opts = { auto_close = false }
  local full_opts = opts and vim.tbl_deep_extend("force", default_opts, opts) or default_opts
  require("snacks").explorer(full_opts)
end

-- Focus the explorer
function M.explorer.focus()
  if not explorer_is_open then
    M.explorer.toggle { auto_close = true }
  else
    vim.cmd.wincmd "p"
  end
end

-- Callback on explorer show
function M.explorer.on_show()
  explorer_is_open = true
  if vim.fn.bufname() == "" then vim.api.nvim_buf_set_name(0, "File Explorer") end
end

-- Callback on explorer close
function M.explorer.on_close() explorer_is_open = false end

return M
