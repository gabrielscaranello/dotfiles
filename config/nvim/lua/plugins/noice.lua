---@type LazySpec
return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = {
    lsp = { progress = { enabled = false } },
    presets = { command_palette = false },
  },
}
