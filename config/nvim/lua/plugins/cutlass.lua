return {
  "gbprod/cutlass.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    cut_key = "x",
    override_del = true,
    exclude = {},
    registers = { select = "_", delete = "_", change = "_" },
  },
  init = function()
    local keymap_opts = { noremap = true, silent = true }
    local keymap = require "utils.keymap"

    keymap.map {
      { "n", "C", '"_C', keymap_opts },
      { "n", "D", '"_D', keymap_opts },
      { "x", "C", '"_C', keymap_opts },
      { "x", "D", '"_D', keymap_opts },
    }
  end,
}
