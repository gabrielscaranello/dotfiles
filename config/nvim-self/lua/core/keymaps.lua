local keymap = require "utils.keymap"

keymap.map {
  -- exit
  { "n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit All" } },
  { "n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force Quit All" } },
  { "n", "<leader>bC", "<cmd>bdelete<cr>", { desc = "Close Current Cuffer" } },

  -- misc
  { "n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "No Highlight" } },
  { "n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" } },
  { "i", "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save File" } },

  -- windows split
  { "n", "<leader>\\v", "<cmd>vsplit<cr>", { desc = "Vertical Split" } },
  { "n", "<leader>\\h", "<cmd>split<cr>", { desc = "Horizontal Split" } },
  { "n", "<leader>\\e", "<C-w>=", { desc = "Make splits equal size" } },
  { "n", "<leader>\\x", "<cmd>close<cr>", { desc = "Close Current Split" } },

  -- window navigation
  { "n", "<C-h>", "<C-w>h", { desc = "Go to left split" } },
  { "n", "<C-j>", "<C-w>j", { desc = "Go to below split" } },
  { "n", "<C-k>", "<C-w>k", { desc = "Go to above split" } },
  { "n", "<C-l>", "<C-w>l", { desc = "Go to right split" } },

  -- package
  { "n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" } },
  { "n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy Sync" } },
}
