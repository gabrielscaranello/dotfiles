return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "folke/todo-comments.nvim",
    "gbprod/yanky.nvim",
  },
  cmd = { "Telescope" },

  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "truncate" },
      file_ignore_patterns = {
        "^%.git[/\\]",
        "[/\\]%.git[/\\]",
        "dist",
        "node_modules",
        "vendor",
        "yarn.lock",
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },

      mappings = {
        i = {
          -- use ctrl-j and ctrl-k to move selection
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",

          --use ctrl-p and ctrl-n cycle history
          ["<C-p>"] = "cycle_history_prev",
          ["<C-n>"] = "cycle_history_next",
        },
      },
    },
  },

  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    telescope.load_extension "fzf"
    telescope.load_extension "yank_history"
  end,
}
