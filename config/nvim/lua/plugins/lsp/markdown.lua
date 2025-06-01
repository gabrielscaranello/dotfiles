return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  opts = {
    file_types = { "markdown" },
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
