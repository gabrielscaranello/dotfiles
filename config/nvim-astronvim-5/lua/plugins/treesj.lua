---@type LazySpec
return {
  "Wansmer/treesj",
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  keys = {
    { "<leader>lo", "<cmd>lua require('treesj').toggle()<cr>", desc = "Toggle Treesitter Join" },
  },
  opts = {
    use_default_keymaps = false,
  },
}
