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
  keys = {
    -- Files
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files (hidden)" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fW", "<cmd>Telescope live_grep hidden=true noignore=true <cr>", desc = "Live Grep (hidden)" },
    { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in Current Buffer" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },

    -- Buffers and helps
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todos" },
    { "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Notifications" },

    -- Git
    { "<leader>fg", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Git Commits (for current file)" },
    { "<leader>gt", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    { "<leader>fG", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },

    -- Diagnostics and LSP
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Document Symbols" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },
  },

  opts = {
    defaults = {
      path_display = { "truncate" },
      file_ignore_patterns = {
        ".git",
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
