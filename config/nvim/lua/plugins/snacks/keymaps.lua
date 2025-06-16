local function keys()
  local config = require "config.snacks"

  return {
    -- Explorer
    { "<leader>e", config.explorer.toggle, { desc = "Explorer (keep open)" } },
    { "<leader>o", config.explorer.focus, { desc = "Explorer (auto close)" } },

    -- Buffers and helps
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Tags",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notifications",
    },
    {
      "<C-i>",
      function()
        Snacks.image.hover()
      end,
      desc = "Image Hover",
    },

    -- Diagnostics and LSP
    {
      "<leader>fd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Document Symbols",
    },
    {
      "<leader>fS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },

    -- Files
    {
      "<leader>f/",
      function()
        Snacks.picker.lines { layout = { preview = nil } }
      end,
      desc = "Grep (Current Buffer)",
    },
    {
      "<leader>fF",
      function()
        Snacks.picker.files { hidden = true }
      end,
      desc = "Find Files (hidden)",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent { filter = { cwd = true } }
      end,
      desc = "Find Recent Files",
    },
    {
      "<leader>fW",
      function()
        Snacks.picker.grep { hidden = true, noignore = true }
      end,
      desc = "Live Grep (hidden)",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live Grep",
    },

    -- Git
    {
      "<leader>fg",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>go",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.gitbrowse.open { what = "repo" }
      end,
      desc = "Open remote repository",
    },
    {
      "<leader>gO",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.gitbrowse.open { what = "file" }
      end,
      desc = "Open file on remote repository",
      mode = { "n", "v" },
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Commits",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Commits (for current file)",
    },
    {
      "<leader>gt",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>fG",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Diff This",
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Blame line",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Open Lazygit",
    },

    -- Words
    {
      "<c-n>",
      function()
        Snacks.words.jump(1, true)
      end,
      desc = "Jump to next word reference",
    },
    {
      "<c-p>",
      function()
        Snacks.words.jump(-1, true)
      end,
      desc = "Jump to previous word reference",
    },
  }
end

return keys
