return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  dependencies = {
    {
      "folke/edgy.nvim",
      opts = function(_, opts)
        if not opts.bottom then
          opts.bottom = {}
        end
        table.insert(opts.bottom, {
          ft = "spectre_panel",
          title = "Search/Replace",
          size = { height = 0.4 },
        })
      end,
    },
  },
  keys = {
    {
      "<leader>ss",
      function()
        require("spectre").open()
      end,
      desc = "Spectre",
    },
    {
      "<leader>sf",
      function()
        require("spectre").open_file_search()
      end,
      desc = "Spectre (current file)",
    },
    {
      mode = "x",
      "<leader>ss",
      function()
        require("spectre").open_visual { select_word = true }
      end,
      desc = "Spectre (visual)",
    },
  },
  opts = {
    open_cmd = "noswapfile new",
    mapping = {
      send_to_qf = { map = "q" },
      replace_cmd = { map = "c" },
      show_option_menu = { map = "o" },
      run_current_replace = { map = "C" },
      run_replace = { map = "R" },
      change_view_mode = { map = "v" },
      resume_last_search = { map = "l" },
    },
  },
}
