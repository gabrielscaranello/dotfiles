-- Close Copilot Chat when leave neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.fn.exists ":CopilotChatClose" == 2 then vim.cmd "CopilotChatClose" end
  end,
})
