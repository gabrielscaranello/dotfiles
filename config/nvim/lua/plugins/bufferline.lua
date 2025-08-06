---@type LazyPluginSpec
return {
  "akinsho/bufferline.nvim",
  dependencies = { "echasnovski/mini.icons" },
  version = "*",
  lazy = false,
  keys = {
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    { "<leader>bn", "<cmd>enew<cr>", desc = "New Buffer" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right Buffers" },
    { "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffers" },
    { "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin Buffer" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete Non-Pinned Buffers" },
  },
  opts = function()
    local Snacks = require "snacks"

    ---@type bufferline.UserConfig
    return {
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
        offsets = {
          { filetype = "snacks_layout_box" },
        },
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with { icon = "" },
          },
        },
      },
    }
  end,

  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
