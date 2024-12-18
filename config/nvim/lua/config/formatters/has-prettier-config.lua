---@return boolean
return function()
  local utils = require "utils.file"
  local eslint_config_files = {
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
    ".prettierrc.yml",
  }

  if utils.files_exists(table.unpack(eslint_config_files)) then return true end
  if utils.has_json_key_in_file("package.json", "prettier") then return true end
  return false
end
