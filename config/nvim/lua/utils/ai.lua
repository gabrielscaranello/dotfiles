local M = {}

---@return 'copilot' | 'codeium' | nil
function M.get_provider()
  return vim.env.AI_PROVIDER or nil
end

---@return boolean
function M.is_copilot_provider()
  return M.get_provider() == "copilot"
end

---@return boolean
function M.is_windsurf_provider()
  return M.get_provider() == "codeium"
end

---@return vim.lsp.Client | nil
function M.get_copilot_client()
  if not M.is_copilot_provider() then
    return nil
  end
  local clients = vim.lsp.get_clients { name = "copilot" }
  return clients[1] or nil
end

---@return boolean
function M.copilot_lsp_is_active()
  return M.get_copilot_client() ~= nil
end

---@return boolean
function M.codeium_is_attached()
  if vim.fn.exists ":Codeium" == 0 then
    return false
  end

  local ok, sources = pcall(require, "blink.cmp.sources.lib")
  if not ok then
    return false
  end

  local provider = sources.get_provider_by_id "codeium"
  return provider ~= nil and provider:enabled()
end

---@return boolean
function M.copilot_is_attached()
  local client = M.get_copilot_client()
  if client == nil then
    return false
  end

  local bufnr = vim.api.nvim_get_current_buf()
  return vim.lsp.buf_is_attached(bufnr, client.id)
end

---@return string[]
function M.get_supported_filetypes()
  return {
    "bash",
    "css",
    "diff",
    "dockerfile",
    "gitattributes",
    "gitcommit",
    "gitconfig",
    "gitignore",
    "gitrebase",
    "go",
    "help",
    "html",
    "http",
    "javascript",
    "javascriptreact",
    "json",
    "kitty",
    "less",
    "lua",
    "make",
    "markdown",
    "plaintex",
    "postcss",
    "prisma",
    "proto",
    "query",
    "scss",
    "sh",
    "svelte",
    "typescript",
    "typescriptreact",
    "typst",
    "vim",
    "vue",
    "yaml",
    "zsh",
  }
end

return M
