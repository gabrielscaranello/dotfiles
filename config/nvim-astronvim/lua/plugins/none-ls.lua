---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local builtins = require "null-ls.builtins"

    config.sources = {
      builtins.diagnostics.editorconfig_checker.with {
        condition = function(utils) return utils.root_has_file { ".editorconfig" } end,
      },
    }

    return config
  end,
}
