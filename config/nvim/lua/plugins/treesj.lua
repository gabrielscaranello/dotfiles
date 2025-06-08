return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>lo",
      function()
        require("treesj").toggle()
      end,
      desc = "Toggle Treesitter Join",
    },
  },
  opts = {
    use_default_keymaps = false,
  },
}
