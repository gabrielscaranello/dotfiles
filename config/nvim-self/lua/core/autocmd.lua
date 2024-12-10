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
