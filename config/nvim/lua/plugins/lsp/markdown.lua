---@type LazyPluginSpec[]
return {
  {
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
    {
      "yousefhadder/markdown-plus.nvim",
      ft = "markdown",
      opts = {
        enabled = true,

        features = {
          list_management = true,
          text_formatting = false,
          thematic_break = false,
          links = false,
          images = false,
          headers_toc = true,
          quotes = false,
          callouts = false,
          code_block = false,
          html_block_awareness = false,
          table = false,
          footnotes = false,
        },

        code_block = {
          enabled = false,
        },

        table = {
          enabled = false,
          auto_format = false,
          keymaps = {
            enabled = false,
          },
        },

        list = {
          smart_outdent = true,
          checkbox_completion = {
            enabled = true,
          },
        },

        links = {
          smart_paste = {
            enabled = false,
            timeout = 5, -- 1..30
          },
        },
      },
    },
  },
}
