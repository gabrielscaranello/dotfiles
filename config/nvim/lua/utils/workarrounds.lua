--- collection of workarrounds
--- rename directory with vtsls
--- - for some reason the snacks.explorer can not rename and replace folders correctly in vtsls

local file_utils = require "utils.file"

local M = {}

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
  return not M.is_tsjs_project() or not M.is_vtsls_active()
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
