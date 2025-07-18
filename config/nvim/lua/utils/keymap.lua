local M = {}

---@class Map
---@field [1] string|string[]
---@field [2] string
---@field [3] string|function
---@field [4] vim.keymap.set.Opts|nil

---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts|nil
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  local final_opts = vim.tbl_extend("force", options, opts or {})
  vim.keymap.set(mode, lhs, rhs, final_opts)
end

---@param mappings Map | Map[]
---@return nil
M.map = function(mappings)
  if type(mappings) ~= "table" then
    map(mappings[1], mappings[2], mappings[3], mappings[4])
    return
  end

  for _, mapping in pairs(mappings) do
    map(mapping[1], mapping[2], mapping[3], mapping[4])
  end
end

return M
