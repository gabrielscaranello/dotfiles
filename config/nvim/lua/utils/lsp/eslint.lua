local M = {}

---@return boolean
function M.exists()
  local utils = require "utils.file"
  local project_files = require "utils.project_config"
  local config_exists = utils.files_exists(unpack(project_files.eslint))

  return config_exists or utils.has_package_json_key "eslintConfig"
end

return M
