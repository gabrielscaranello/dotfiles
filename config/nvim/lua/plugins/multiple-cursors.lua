return {
  "brenton-leighton/multiple-cursors.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = {
    "MultipleCursorsAddDown",
    "MultipleCursorsAddUp",
    "MultipleCursorsMouseAddDelete",
    "MultipleCursorsAddMatches",
    "MultipleCursorsAddMatchesV",
    "MultipleCursorsAddJumpNextMatch",
    "MultipleCursorsJumpNextMatch",
    "MultipleCursorsLock",
  },

  keys = {
    {
      "<S-Down>",
      "<Cmd>MultipleCursorsAddDown<CR>",
      desc = "Add cursor down",
      mode = { "n", "i" },
    },
    {
      "<S-Up>",
      "<Cmd>MultipleCursorsAddUp<CR>",
      desc = "Add cursor up",
      mode = { "n", "i" },
    },
    {
      "<C-LeftMouse>",
      "<Cmd>MultipleCursorsMouseAddDelete<CR>",
      desc = "Add cursor with mouse",
      mode = { "n", "i" },
    },

    {
      "<leader>ca",
      "<Cmd>MultipleCursorsAddMatches<CR>",
      desc = "Add matches",
      mode = { "n", "x" },
    },
    {
      "<leader>cA",
      "<Cmd>MultipleCursorsAddMatchesV<CR>",
      desc = "Add cursor matches in previous visual area",
      mode = { "n", "x" },
    },
    {
      "<leader>cj",
      "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
      desc = "Add cursor and jump to next match",
      mode = { "n", "x" },
    },
    {
      "<leader>cJ",
      "<Cmd>MultipleCursorsJumpNextMatch<CR>",
      desc = "Move cursor to next match",
      mode = { "n", "x" },
    },
    {
      "<leader>cl",
      "<Cmd>MultipleCursorsLock<CR>",
      desc = "Lock virtual cursors",
      mode = { "n", "x" },
    },
  },

  opts = {},
}
