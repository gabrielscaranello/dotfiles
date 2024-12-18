---@return boolean
return function()
  local utils = require "utils.file"
  local config_exists = utils.files_exists(
    ".prettierrc",
    ".prettierrc.cjs",
    ".prettierrc.cts",
    ".prettierrc.js",
    ".prettierrc.json",
    ".prettierrc.json5",
    ".prettierrc.mjs",
    ".prettierrc.mts",
    ".prettierrc.toml",
    ".prettierrc.ts",
    ".prettierrc.yaml",
    ".prettierrc.yml"
  )

  if config_exists then return true end
  if utils.has_package_json_key "prettier" then return true end
  return false
end
