---@type LazySpec
return {
  "rcarriga/nvim-notify",
  opts = function(_, opts)
    opts.top_down = false
    opts.max_width = 50
    opts.mininum_width = 40
  end,
}
