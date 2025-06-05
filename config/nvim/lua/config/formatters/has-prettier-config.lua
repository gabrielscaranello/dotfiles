---@return boolean
return function()
  local utils = require "utils.file"
  local files = unpack(utils.prettier_config_files)
  local config_exists = utils.files_exists(files)

  if config_exists then return true end
  if utils.has_package_json_key "prettier" then return true end
  return false
end
