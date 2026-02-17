---@type LazyPluginSpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  version = "^v8",
  ft = { "markdown", "copilot-chat" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  opts = {
    file_types = { "markdown" },
    initial_state = nil,
    heading = {
      position = "inline",
      width = "block",
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      width = "block",
    },
    sign = {
      enabled = false,
    },
  },
}
