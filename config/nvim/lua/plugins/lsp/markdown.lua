---@type LazyPluginSpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "copilot-chat" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  opts = {
    file_types = { "markdown", "copilot-chat" },
    initial_state = true,
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
