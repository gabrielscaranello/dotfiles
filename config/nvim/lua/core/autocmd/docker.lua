vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "docker-compose.yaml",
  callback = function() vim.bo.filetype = "yaml.docker-compose" end,
})
