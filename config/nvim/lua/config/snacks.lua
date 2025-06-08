local explorer_is_open = false
local M = {
  -- Snacks explorer custom functions
  explorer = {},
}

-- Define a more specific type for the options
---@class ExplorerToggleOpts
---@field auto_close? boolean

-- Toggle the explorer
---@param opts? ExplorerToggleOpts
function M.explorer.toggle(opts)
  local default_opts = { auto_close = false }
  local full_opts = opts and vim.tbl_deep_extend("force", default_opts, opts) or default_opts
  require("snacks").explorer(full_opts)
end

-- Focus the explorer
function M.explorer.focus()
  if not explorer_is_open then
    M.explorer.toggle { auto_close = true }
  else
    vim.cmd.wincmd "p"
  end
end

-- Callback on explorer show
function M.explorer.on_show()
  explorer_is_open = true
  if vim.fn.bufname() == "" then
    vim.api.nvim_buf_set_name(0, "File Explorer")
  end
end

-- Callback on explorer close
function M.explorer.on_close()
  explorer_is_open = false
end

-- Various options to copy file name ou path to clipboard
function M.explorer.copy_actions()
  if not explorer_is_open then
    return
  end

  local pickers = Snacks.picker.get()
  if #pickers == 0 then
    return
  end

  local current = pickers[1]:current { resolve = true }
  if not current or not current.file then
    vim.notify("No file or directory selected", vim.log.levels.WARN)
    return
  end

  ---@type string absolute fs file path
  local path = current.file
  ---@type string file path relative to cwd
  local rel_path = vim.fn.fnamemodify(path, ":.")

  local values = {
    ["PATH (CWD)"] = rel_path,
    ["PATH (HOME)"] = path,
    ["URI"] = vim.uri_from_fname(path),
  }

  if vim.fn.isdirectory(path) == 1 then
    values["DIRECTORY"] = vim.fn.fnamemodify(rel_path, ":t")
  else
    values["BASENAME"] = vim.fn.fnamemodify(rel_path, ":t:r")
    values["EXTENSION"] = vim.fn.fnamemodify(rel_path, ":e")
    values["FILENAME"] = vim.fn.fnamemodify(rel_path, ":t")
  end

  local options = vim.tbl_filter(function(val)
    return values[val] ~= ""
  end, vim.tbl_keys(values))

  if vim.tbl_isempty(options) then
    vim.notify("No values to copy", vim.log.levels.WARN)
    return
  end

  table.sort(options)
  vim.ui.select(vim.tbl_values(options), {
    prompt = "Choose to copy to clipboard:",
    format_item = function(item)
      return ("%s: %s"):format(item, values[item])
    end,
  }, function(choice)
    if not choice then
      return
    end

    local result = values[choice]
    if result then
      vim.fn.setreg("+", result)
      vim.notify(("Copied: `%s`"):format(result))
    end
  end)
end

return M
