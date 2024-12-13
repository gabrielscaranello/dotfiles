return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
    { "R", function() require("flash").treesitter_search() end, mode = { "x", "o" }, desc = "Treesitter Search" },
    { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash Treesitter" },
    { "r", function() require("flash").remote() end, mode = { "o" }, desc = "Remote Flash" },
  },
  opts = {},
}
