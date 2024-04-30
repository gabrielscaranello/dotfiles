---@type LazySpec
return {
  "nvim-pack/nvim-spectre",
  opts = function(_, opts) opts.open_cmd = "noswapfile new" end,
}
