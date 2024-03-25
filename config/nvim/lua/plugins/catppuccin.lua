---@type LazySpec
return {
  "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = false,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      mason = true,
      native_lsp = { enabled = true },
      neotest = true,
      neotree = true,
      noice = true,
      notifier = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = { enabled = true },
      treesitter = true,
      which_key = true,
    },
  },
}
