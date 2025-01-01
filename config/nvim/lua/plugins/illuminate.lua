return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    delay = 200,
    under_cursor = true,
    filetypes_denylist = {
      "NeoTree",
      "alpha",
    },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
