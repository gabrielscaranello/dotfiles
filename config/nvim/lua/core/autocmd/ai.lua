-- Close Copilot Chat when leave neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.fn.exists ":CopilotChatClose" == 2 then vim.cmd "CopilotChatClose" end
  end,
})

-- Remove relative numbers in Copilot Chat buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-chat",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
  end,
})
