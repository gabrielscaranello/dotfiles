local completion_ai = vim.g.completion_ai
local M = {}

function M.ai_priority(entry1, entry2)
  if entry1.source.name == completion_ai and entry2.source.name ~= completion_ai then
    return true
  elseif entry2.source.name == completion_ai and entry1.source.name ~= completion_ai then
    return false
  end
  return nil
end

return M
