---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    local cmp = require "cmp"

    opts.sources = cmp.config.sources {
      { name = "codeium", priority = 1250 },
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "emoji", priority = 700 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
    }

    return opts
  end,
}
