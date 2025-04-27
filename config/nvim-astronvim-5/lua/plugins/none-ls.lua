---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local builtins = require "null-ls.builtins"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      builtins.diagnostics.editorconfig_checker.with {
        condition = function(utils) return utils.root_has_file { ".editorconfig" } end,
      },
    })
  end,
}
