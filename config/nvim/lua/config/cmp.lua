local M = {}

---@param a blink.cmp.CompletionItem
---@return boolean|nil
function M.underscore_last(a)
  if a.label:sub(1, 1) == "_" ~= a.label:sub(1, 1) == "_" then
    -- return true to sort `a` after `b`, and vice versa
    return not a.label:sub(1, 1) == "_"
  end
  -- nothing returned, fallback to the next sort
end

return M
