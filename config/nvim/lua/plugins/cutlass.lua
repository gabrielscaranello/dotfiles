return {
  "gbprod/cutlass.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    cut_key = "x",
    override_del = true,
    exclude = {},
    registers = { select = "_", delete = "_", change = "_" },
  },
}
