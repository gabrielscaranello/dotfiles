local ai = require "utils.ai"

---@type vim.lsp.Config
return {
  on_init = function()
    if not ai.is_copilot_provider() then
      return
    end
  end,
}
