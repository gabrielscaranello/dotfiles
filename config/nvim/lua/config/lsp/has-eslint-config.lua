---@return boolean
return function()
  local utils = require "utils.file"
  local eslint_config_files = {
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
    "eslint.config.ts",
  }

  if utils.files_exists(table.unpack(eslint_config_files)) then return true end
  if utils.has_json_key_in_file("package.json", "eslintConfig") then return true end
  return false
end
