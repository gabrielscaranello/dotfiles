local M = {}

---@return boolean
function M.exists()
  local utils = require "utils.file"
  local project_files = require "utils.project_config"
  local files = unpack(project_files.eslint)
  local config_exists = utils.files_exists(files)

  if config_exists then return true end
  if utils.has_package_json_key "eslintConfig" then return true end
  return false
end

return M
