return {
  "echasnovski/mini.splitjoin",
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  keys = {
    { "<leader>lo", function() require("mini.splitjoin").toggle() end, desc = "Toggle Split/Join" },
  },
  opts = {
    mappings = { toggle = "", split = "", join = "" },
  },
}
