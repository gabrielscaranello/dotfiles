---@type LazyPluginSpec
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = function()
    local icons = require "utils.icons"

    return {
      environment_scope = "g",
      global_keymaps = false,
      global_keymaps_prefix = "",
      kulala_keymaps = true,
      kulala_keymaps_prefix = "",
      vscode_rest_client_environmentvars = true,
      icons = {
        inlay = {
          loading = icons.misc.loading,
          done = icons.misc.done,
          error = icons.misc.error,
        },
      },
      ui = {
        display_mode = "split",
        split_direction = "horizontal",
      },

      lsp = { enable = false },
    }
  end,
  keys = {
    {
      "<leader>hr",
      function()
        require("kulala").run()
      end,
      desc = "Run request under the cursor",
      ft = { "http", "rest" },
    },
    {
      "<leader>hl",
      function()
        require("kulala").replay()
      end,
      desc = "Run last request",
      ft = { "http", "rest" },
    },
    {
      "<leader>hp",
      function()
        require("kulala").jump_prev()
      end,
      desc = "Jump to previous request",
      ft = { "http", "rest" },
    },
    {
      "<leader>hn",
      function()
        require("kulala").jump_next()
      end,
      desc = "Jump to next request",
      ft = { "http", "rest" },
    },
    {
      "<leader>he",
      function()
        require("kulala").set_selected_env()
      end,
      desc = "Select environment variables file",
      ft = { "http", "rest" },
    },
  },
}
