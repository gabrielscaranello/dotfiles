local M = {}

---@param path string
---@return boolean
function M.file_exists(path) return vim.fn.glob(path) ~= "" end

---@param ... string
---@return boolean
function M.files_exists(...)
  for _, path in pairs { ... } do
    if M.file_exists(path) then return true end
  end
  return false
end

---@param path string
---@param key string
---@return boolean
function M.has_json_key_in_file(path, key)
  if not M.file_exists(path) then return false end
  local json = vim.fn.json_decode(vim.fn.readfile(path))
  return json and json[key] ~= nil
end

return M
