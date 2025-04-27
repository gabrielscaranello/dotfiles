---@type LazySpec
return {
  "gbprod/cutlass.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["C"] = { '"_C' },
            ["D"] = { '"_D' },
          },
          x = {
            ["C"] = { '"_C' },
            ["D"] = { '"_D' },
          },
        },
      },
    },
  },
  opts = {
    cut_key = "x",
    override_del = true,
    exclude = {},
    registers = { select = "_", delete = "_", change = "_" },
  },
}
