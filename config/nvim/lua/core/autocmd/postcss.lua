vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pcss",
  callback = function()
    vim.bo.filetype = "postcss"
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.postcss",
  callback = function()
    vim.bo.filetype = "postcss"
  end,
})
