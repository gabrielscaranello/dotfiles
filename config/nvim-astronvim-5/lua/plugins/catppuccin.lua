---@type LazySpec
return {
  "catppuccin/nvim",
  opts = function(_, opts)
    local integrations = opts.integrations or {}
    opts.flavour = "mocha"
    opts.transparent_background = true

    integrations.noice = true
    integrations.dropbar = { enabled = true }
    integrations.snacks = { enabled = true, indent_scope_color = "blue" }

    opts.integrations = integrations
  end,
}
