local M = {}

---@return boolean
function M.exists()
  local utils = require "utils.file"
  local files = unpack(utils.eslint_config_files)
  local config_exists = utils.files_exists(files)

  if config_exists then return true end
  if utils.has_package_json_key "eslintConfig" then return true end
  return false
end

return M
