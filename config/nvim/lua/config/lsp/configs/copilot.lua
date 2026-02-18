---@type vim.lsp.Config
return {
  filetypes = require("utils.ai").get_supported_filetypes(),
  on_init = function()
    local ai = require "utils.ai"

    if not ai.is_copilot_provider() then
      return
    end
  end,
  on_attach = function(client, bufnr)
    local ai = require "utils.ai"

    if not ai.is_copilot_provider() then
      return
    end
  end,
}
