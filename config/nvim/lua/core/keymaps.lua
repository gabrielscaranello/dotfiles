local keymap = require "utils.keymap"
local spell_utils = require "utils.spell"

keymap.map {
  -- exit
  { "n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit All" } },
  { "n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force Quit All" } },
  { "n", "<leader>bC", "<cmd>bdelete<cr>", { desc = "Close Current Cuffer" } },

  -- misc
  { "n", "<leader>n", "<cmd>nohlsearch<cr>", { desc = "No Highlight" } },
  { "n", "<leader><space>", "<leader>ff", { remap = true, desc = "Find Files" } },
  { "n", "<leader>bR", "<cmd>e!<cr>", { desc = "Reload File" } },
  { "n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" } },
  { { "v", "n" }, ";", ":", { desc = "Enter Command Mode", silent = false } },
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
  { "n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Resize split up" } },
  { "n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Resize split down" } },
  {
    "n",
    "<C-Left>",
    "<cmd>vertical resize -2<cr>",
    { desc = "Resize split left" },
  },
  {
    "n",
    "<C-Right>",
    "<cmd>vertical resize +2<cr>",
    { desc = "Resize split right" },
  },

  -- spell
  { "n", "<leader>dt", spell_utils.toggle_spell, { desc = "Toggle Spellcheck" } },
  {
    "n",
    "<leader>dp",
    function()
      spell_utils.set_spelllang "pt_br"
    end,
    { desc = "Set Spellcheck to Portuguese" },
  },
  {
    "n",
    "<leader>de",
    function()
      spell_utils.set_spelllang "en"
    end,
    { desc = "Set Spellcheck to English" },
  },
  {
    "n",
    "<leader>db",
    function()
      spell_utils.set_spelllang "pt_br,en"
    end,
    { desc = "Set Spellcheck to Portuguese and English" },
  },

  -- package
  { "n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" } },
  { "n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy Sync" } },
  { "n", "<leader>pm", "<cmd>Mason<cr>", { desc = "Mason" } },
}
