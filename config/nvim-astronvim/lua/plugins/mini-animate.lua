---@type LazySpec
return {
  "echasnovski/mini.animate",
  opts = function(_, opts)
    local open = opts.open or {}
    local close = opts.close or {}

    open.enable = false
    close.enable = false
    opts.open = open
    opts.close = close
  end,
}
