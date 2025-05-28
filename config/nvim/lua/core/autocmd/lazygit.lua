vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*lazygit*",
  callback = function()
    vim.cmd.bufdo "e"
    require("lazy.core.loader").reload "gitsigns.nvim"
  end,
})
