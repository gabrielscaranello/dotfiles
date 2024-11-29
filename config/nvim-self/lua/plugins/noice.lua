return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = { enabled = false },
    },

    presets = {
      command_palette = false,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = false,
    },
  },
}