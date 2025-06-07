local M = {}

---@return boolean
function M.exists()
  local utils = require "utils.file"
  local project_files = require "utils.project_config"
  local files = unpack(project_files.prettier)
  local config_exists = utils.files_exists(files)

  if config_exists then return true end
  if utils.has_package_json_key "prettier" then return true end
  return false
end

---@param ctx conform.Context
---@return boolean
function M.conform_condition(_, ctx)
  local patterns = { "%.mdx?$", "%.ya?ml$", "%.json$" }

  for _, pattern in pairs(patterns) do
    if ctx.filename:match(pattern) then return true end
  end

  return M.exists()
end

return M
