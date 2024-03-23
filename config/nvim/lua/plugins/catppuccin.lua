---@type LazySpec
return {
  "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = false,
    integrations = {
      cmp = true,
      mason = true,
      native_lsp = { enabled = true },
      neotree = true,
      neotest = true,
      noice = true,
      notifier = true,
      treesitter = true,
      telescope = { enabled = true },
      which_key = true,
    },
  },
}
