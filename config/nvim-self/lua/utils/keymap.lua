local M = {}

---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts table|nil
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  local final_opts = vim.tbl_extend("force", options, opts or {})
  vim.keymap.set(mode, lhs, rhs, final_opts)
end

---@param mappings table[]|table
---{
---  { mode, lhs, rhs, opts }
---}
---@return nil
M.map = function(mappings)
  if type(mappings) ~= "table" then
    map(mappings[1], mappings[2], mappings[3], mappings[4])
    return
  end

  for _, mapping in ipairs(mappings) do
    map(mapping[1], mapping[2], mapping[3], mapping[4])
  end
end

return M
