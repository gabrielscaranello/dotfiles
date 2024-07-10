---@type LazySpec
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- Extra packages
  { import = "lazyvim.plugins.extras.lsp.none-ls" },

  -- Extra lang
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
}
