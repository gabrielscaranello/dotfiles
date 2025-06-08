---@param paths? string
local function grupfar(paths)
  local grug = require "grug-far"
  local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
  grug.open {
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      paths = paths,
    },
  }
end

return {
  "MagicDuck/grug-far.nvim",
  opts = { headerMaxWidth = 80 },
  cmd = "GrugFar",
  keys = {
    {
      "<leader>rs",
      grupfar,
      mode = { "n", "v" },
      desc = "Search / Replace",
    },
    {
      "<leader>rf",
      function()
        grupfar(vim.fn.expand "%")
      end,
      mode = { "n", "v" },
      desc = "Search / Replace (Current File)",
    },
  },
}
