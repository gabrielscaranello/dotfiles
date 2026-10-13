local M = {}

---@param a blink.cmp.CompletionItem
---@param b blink.cmp.CompletionItem
---@return boolean|nil
function M.underscore_last(a, b)
  local a_under = a.label:sub(1, 1) == "_"
  local b_under = b.label:sub(1, 1) == "_"
  if a_under ~= b_under then
    -- return true to sort `a` before `b`, and vice versa
    return not a_under
  end
  -- nothing returned, fallback to the next sort
end

return M
