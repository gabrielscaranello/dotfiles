return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
  dependencies = { "echasnovski/mini.icons", "folke/todo-comments.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>xx", "<cmd>Trouble<cr>", desc = "Open/Close Trouble List" },
    { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document Diagnostics" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Open Todos in Trouble" },
  },
  opts = {},
}
