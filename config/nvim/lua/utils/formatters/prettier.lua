local M = {}

---@return boolean
function M.exists()
  local utils = require "utils.file"
  local project_files = require "utils.project_config"
  local files = unpack(project_files.prettier)
  local config_exists = utils.files_exists(files)

  return config_exists or utils.has_package_json_key "prettier"
end

---@return boolean
function M.conform_condition(_, ctx)
  if M.exists() then
    return true
  end

  local patterns = { "%.mdx?$", "%.ya?ml$", "%.json$" }
  local filename = ctx and ctx.filename or ""

  for _, pattern in pairs(patterns) do
    if filename:match(pattern) then
      return true
    end
  end

  return false
end

return M
