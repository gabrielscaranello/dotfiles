---@type LazyPluginSpec
return {
  "akinsho/bufferline.nvim",
  dependencies = { "echasnovski/mini.icons" },
  version = "*",
  lazy = false,
  after = "catppuccin",
  keys = {
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    { "<leader>bn", "<cmd>enew<cr>", desc = "New Buffer" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right Buffers" },
    { "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffers" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin Buffer" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
  },
  opts = function()
    local Snacks = require "snacks"
    local catppuccin_highlights = require "catppuccin.groups.integrations.bufferline"

    return {
      highlights = catppuccin_highlights.get(),
      options = {
        close_command = function(n)
          Snacks.bufdelete(n)
        end,
        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        always_show_bufferline = true,
        enforce_regular_tabs = true,
        offsets = {},
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with { icon = "" },
          },
        },
      },
    }
  end,
}
