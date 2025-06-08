return {
  "folke/edgy.nvim",
  opts = {
    keys = {
      -- increase width
      ["<C-Left>"] = function(win)
        win:resize("width", 2)
      end,
      -- decrease width
      ["<C-Right>"] = function(win)
        win:resize("width", -2)
      end,
      -- increase height
      ["<C-Up>"] = function(win)
        win:resize("height", 2)
      end,
      -- decrease height
      ["<C-Down>"] = function(win)
        win:resize("height", -2)
      end,
    },
  },
}
