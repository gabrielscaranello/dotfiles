---@type LazySpec
return {
  "catppuccin/nvim",
  opts = function(_, opts)
    local integrations = opts.integrations or {}
    opts.flavour = "mocha"
    opts.transparent_background = true

    integrations.aerial = true
    integrations.alpha = true
    integrations.cmp = true
    integrations.dap = true
    integrations.dap_ui = true
    integrations.mason = true
    integrations.native_lsp = { enabled = true }
    integrations.neotest = true
    integrations.neotree = true
    integrations.noice = true
    integrations.notifier = true
    integrations.semantic_tokens = true
    integrations.symbols_outline = true
    integrations.telescope = { enabled = true }
    integrations.treesitter = true
    integrations.which_key = true

    opts.integrations = integrations
  end,
}
