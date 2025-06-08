return {
  "mistricky/codesnap.nvim",
  cmd = {
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
  },
  build = "make",

  keys = {
    {
      "<leader>cs",
      ":'<,'>CodeSnap<CR>",
      desc = "CodeSnap (clipboard)",
      mode = "v",
      silent = true,
    },
    {
      "<leader>cS",
      ":'<,'>CodeSnapSave<CR>",
      desc = "CodeSnap (save)",
      mode = "v",
      silent = true,
    },
    {
      "<leader>ch",
      ":'<,'>CodeSnapHighlight<CR>",
      desc = "CodeSnap with highlight (clipboard)",
      mode = "v",
      silent = true,
    },
    {
      "<leader>cH",
      ":'<,'>CodeSnapSaveHighlight<CR>",
      desc = "CodeSnap with highlight (save)",
      mode = "v",
      silent = true,
    },
  },
  opts = {
    mac_window_bar = false,
    watermark = "",
    bg_color = "#181825",
    bg_x_padding = 92,
    bg_y_padding = 64,
    save_path = "~/Code/Snapshots",
    code_font_family = "JetBrainsMono Nerd Font",
  },
}
