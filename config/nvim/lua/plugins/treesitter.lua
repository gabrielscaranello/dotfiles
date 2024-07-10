---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {"catppuccin/nvim"},
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "make",
      "scss",
      "styled",
    })
  end,
}
