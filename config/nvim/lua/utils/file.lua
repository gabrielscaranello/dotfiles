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
  if key == "" or key == nil then return false end

  local json = vim.fn.json_decode(vim.fn.readfile(path))
  if not json then return false end

  local keys = {}
  for chunk in string.gmatch(key, "([^%.]+)") do
    table.insert(keys, chunk)
  end

  local tmp_json = json
  for _, key_part in ipairs(keys) do
    tmp_json = tmp_json[key_part]
    if tmp_json == nil then return false end
  end

  return true
end

---@param key string
---@return boolean
function M.has_package_json_key(key)
  local file = "package.json"

  return M.file_exists(file) and M.has_json_key_in_file(file, key)
end

return M
