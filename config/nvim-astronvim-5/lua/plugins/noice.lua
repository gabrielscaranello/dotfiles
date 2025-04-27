---@type LazySpec
return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },

      progress = { enabled = false },
      signature = { enabled = false },
      hover = { enabled = false },
    },
    presets = {
      command_palette = false,
    },
  },
}
