---@return boolean
return function()
  local utils = require "utils.file"
  local config_exists = utils.files_exists(
    ".eslintrc",
    ".eslintrc.cjs",
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    "eslint.config.cjs",
    "eslint.config.cts",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.mts",
    "eslint.config.ts"
  )

  if config_exists then return true end
  if utils.has_json_key_in_file("package.json", "eslintConfig") then return true end
  return false
end
