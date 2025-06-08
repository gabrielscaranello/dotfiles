--- collection of workarrounds
--- rename directory with vtsls
--- - for some reason the snacks.explorer can not rename and replace folders correctly in vtsls
--- use vue_ls for typescript files in projects with vue
--- use vtsls for typescript files in projects without vue

local file_utils = require "utils.file"

local M = {
  has_vue = nil,
}

---@return boolean
function M.is_tsjs_project()
  return file_utils.files_exists("tsconfig.json", "jsconfig.json", "package.json")
end

---@return boolean
function M.is_vtsls_active()
  return #vim.lsp.get_clients { name = "vtsls" } > 0
end

---@return boolean
function M.is_regular_file_rename()
  return not M.is_tsjs_project() and not M.is_vtsls_active()
end

---@return boolean
---@param file string
function M.has_vue_dependencies(file)
  local package_json = file_utils.read_json(file)
  if package_json == nil then
    return false
  end

  local dependencies = package_json.dependencies or {}
  local devDependencies = package_json.devDependencies or {}

  return dependencies.vue ~= nil or devDependencies.vue ~= nil
end

---@return table<string>
local function get_workspaces()
  local package_json = file_utils.read_json "package.json"
  if package_json == nil then
    return {}
  end
  if not package_json.workspaces or type(package_json.workspaces) ~= "table" then
    return {}
  end
  local workspaces = {}

  local function expand_workspace(pattern)
    local files = vim.fn.glob(pattern, true, true)
    return vim.tbl_filter(function(f)
      return vim.fn.isdirectory(f) == 1
    end, files)
  end

  for _, workspace in ipairs(package_json.workspaces) do
    local patterns = type(workspace) == "table" and workspace or { workspace }
    for _, pattern in ipairs(patterns) do
      vim.list_extend(workspaces, expand_workspace(pattern))
    end
  end

  return workspaces
end

---@return boolean
function M.is_vue_project()
  local result = function(value)
    M.has_vue = value
    return value
  end

  if not M.is_tsjs_project() then
    return result(false)
  end
  if file_utils.file_exists "package.json" and M.has_vue_dependencies "package.json" then
    return result(true)
  end

  --- verify if has vue in workspaces
  local workspaces = get_workspaces()
  for _, workspace in pairs(workspaces) do
    local file = workspace .. "/package.json"
    if file_utils.file_exists(file) and M.has_vue_dependencies(file) then
      return result(true)
    end
  end

  return result(false)
end

---@param name string
function M.get_ft(name)
  local has_vue = M.has_vue ~= nil and M.has_vue or M.is_vue_project()
  local tsjs_ft = {
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  }

  if name == "vtsls" then
    if has_vue then
      return {}
    end
    return tsjs_ft
  end
  if name == "vue_ls" then
    if has_vue then
      return vim.tbl_extend("force", { "vue" }, tsjs_ft)
    end
    return { "vue" }
  end

  return {}
end

---@param picker snacks.Picker
---@param item snacks.picker.Item
---@return string|nil
function M.typescript_rename_file(picker, item)
  if not item or not item.file or item.file == "" then
    return
  end

  local root = vim.fn.getcwd()
  local from = vim.fn.fnamemodify(item.file, ":p")

  if from:find(root, 1, true) ~= 1 then
    root = vim.fn.fnamemodify(from, ":p:h")
  end
  local extra = from:sub(#root + 2)

  vim.ui.input({
    prompt = "New File Name: ",
    default = extra,
    completion = "file",
  }, function(value)
    if not value or value == "" or value == extra then
      return
    end

    local to = svim.fs.normalize(root .. "/" .. value)
    local ok, rename = pcall(require, "vtsls.rename")
    if not ok then
      return
    end

    rename(from, to, function()
      local tree_ok, Tree = pcall(require, "snacks.explorer.tree")
      local actions_ok, Actions = pcall(require, "snacks.explorer.actions")
      if not tree_ok or not actions_ok then
        return
      end

      Tree:refresh(vim.fs.dirname(from))
      Tree:refresh(vim.fs.dirname(to))
      picker.list:set_selected() -- clear selection
      Actions.update(picker, { target = to })
    end)
  end)
end

return M
