vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "docker-compose.yaml",
  callback = function() vim.bo.filetype = "yaml.docker-compose" end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pcss",
  callback = function() vim.bo.filetype = "postcss" end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.postcss",
  callback = function() vim.bo.filetype = "postcss" end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local icons = require "utils.icons"
    for type, icon in pairs(icons.diagnostics) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
})
