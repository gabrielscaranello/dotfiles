---@type LazySpec
return {
  "rcarriga/nvim-notify",
  enabled = false,
  opts = function(_, opts)
    opts.background_colour = "#000000"
    return opts
  end,
}
