local keymap = require "utils.keymap"

keymap.map {
  -- exit
  { "i", "jk", "<Esc>", { desc = "Exit insert mode with jk" } },
  { "n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit All" } },
  { "n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force Quit All" } },

  -- misc
  { "n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "No Highlight" } },
  { { "i", "n" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" } },

  -- windows split
  { "n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical Split" } },
  { "n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal Split" } },
  { "n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" } },
  { "n", "<leader>sx", "<cmd>close<cr>", { desc = "Close Current Split" } },

  -- window navigation
  { "n", "<C-h>", "<C-w>h", { desc = "Go to left split" } },
  { "n", "<C-j>", "<C-w>j", { desc = "Go to below split" } },
  { "n", "<C-k>", "<C-w>k", { desc = "Go to above split" } },
  { "n", "<C-l>", "<C-w>l", { desc = "Go to right split" } },

  -- package
  { "n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" } },
  { "n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy Sync" } },
}
