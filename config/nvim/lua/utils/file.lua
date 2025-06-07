local M = {}

---@param path string
---@return boolean
function M.file_exists(path) return vim.fn.glob(path) ~= "" end

---@param ... string
---@return boolean
function M.files_exists(...)
  for _, path in pairs { ... } do
    if M.file_exists(path) then return true end
  end
  return false
end

---@param path string
---@param key string
---@return boolean
function M.has_json_key_in_file(path, key)
  if key == "" or key == nil then return false end

  local json = vim.fn.json_decode(vim.fn.readfile(path))
  if not json then return false end

  local keys = {}
  for chunk in string.gmatch(key, "([^%.]+)") do
    table.insert(keys, chunk)
  end

  local tmp_json = json
  for _, key_part in ipairs(keys) do
    tmp_json = tmp_json[key_part]
    if tmp_json == nil then return false end
  end

  return true
end

---@param key string
---@return boolean
function M.has_package_json_key(key)
  local file = "package.json"

  return M.file_exists(file) and M.has_json_key_in_file(file, key)
end

---@return boolean
function M.is_tsjs_project() return M.files_exists("tsconfig.json", "jsconfig.json", "package.json") end

---@param picker snacks.Picker
---@param item snacks.picker.Item
---@return string|nil
function M.typescript_rename_file(picker, item)
  if not item or item == "" then return end

  local root = vim.fn.getcwd()
  local from = vim.fn.fnamemodify(item.file, ":p")

  if from:find(root, 1, true) ~= 1 then root = vim.fn.fnamemodify(from, ":p:h") end
  local extra = from:sub(#root + 2)

  vim.ui.input({
    prompt = "New File Name: ",
    default = extra,
    completion = "file",
  }, function(value)
    if not value or value == "" or value == extra then return end
    local to = svim.fs.normalize(root .. "/" .. value)
    local ok, rename = pcall(require, "vtsls.rename")
    if not ok then return end
    rename(from, to, function()
      local tree_ok, Tree = pcall(require, "snacks.explorer.tree")
      local actions_ok, Actions = pcall(require, "snacks.explorer.actions")
      if not tree_ok or not actions_ok then return end

      Tree:refresh(vim.fs.dirname(from))
      Tree:refresh(vim.fs.dirname(to))
      picker.list:set_selected() -- clear selection
      Actions.update(picker, { target = to })
    end)
  end)
end

M.prettier_config_files = {
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

M.eslint_config_files = {
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

M.babel_config_files = {
  ".babelrc",
  ".babelrc.cjs",
  ".babelrc.js",
  ".babelrc.json",
  ".babelrc.mjs",
  ".babelrc.mts",
  "babel.config.cjs",
  "babel.config.cts",
  "babel.config.js",
  "babel.config.mjs",
  "babel.config.mts",
  "babel.config.ts",
}

M.vite_config_files = {
  "vite.config.cjs",
  "vite.config.cts",
  "vite.config.js",
  "vite.config.mjs",
  "vite.config.mts",
  "vite.config.ts",
}

M.vitest_config_files = {
  "vitest.config.cjs",
  "vitest.config.cts",
  "vitest.config.js",
  "vitest.config.mjs",
  "vitest.config.mts",
  "vitest.config.ts",
  "vitest.workspace.cjs",
  "vitest.workspace.cts",
  "vitest.workspace.js",
  "vitest.workspace.mjs",
  "vitest.workspace.mts",
  "vitest.workspace.ts",
}

M.jest_config_files = {
  "jest.config.cjs",
  "jest.config.cts",
  "jest.config.js",
  "jest.config.json",
  "jest.config.mjs",
  "jest.config.mts",
  "jest.config.ts",
}

M.docker_config_files = {
  ".dockerignore",
  "docker-compose.yaml",
  "docker-compose.yml",
  "Dockerfile",
  "Dockerfile.dev",
  "Dockerfile.prod",
}

return M
