---@type vim.lsp.Config
return {
  filetypes = require("utils.ai").get_supported_filetypes(),
  on_init = function(client)
    local ai = require "utils.ai"

    if not ai.is_copilot_provider() then
      if client and client.stop then
        client.stop()
      end
      return false
    end
  end,
  on_attach = function(client, bufnr)
    local ai = require "utils.ai"

    if not ai.is_copilot_provider() then
      return
    end

    local copilot_config_path = vim.api.nvim_get_runtime_file("lsp/copilot.lua", false)[1]
    if not copilot_config_path then
      return
    end

    local copilot_ok, copilot = pcall(dofile, copilot_config_path)
    if not copilot_ok or not copilot or not copilot.on_attach then
      return
    end

    copilot.on_attach(client, bufnr)
  end,
}
