---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
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
    }
  },
  init = function()
    vim.cmd([[colorscheme catppuccin]])
  end
}
