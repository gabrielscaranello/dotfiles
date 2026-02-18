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

    local file_utils = require "utils.file"
    local lazy_intall_dir = vim.fn.stdpath "data" .. "/lazy"
    local copilot_config_path = lazy_intall_dir .. "/nvim-lspconfig/lsp/copilot.lua"

    if not file_utils.file_exists(copilot_config_path) then
      return
    end

    local copilot_ok, copilot = pcall(dofile, copilot_config_path)
    if not copilot_ok then
      return
    end

    copilot.on_attach(client, bufnr)
  end,
}
