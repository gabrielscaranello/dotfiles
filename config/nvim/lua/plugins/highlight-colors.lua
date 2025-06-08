---@type LazyPluginSpec
return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  opts = {
    render = "virtual",
    enabled_named_colors = true,
    virtual_symbol = "󱓻",
    exclude_filetypes = {
      "lazy",
    },
  },
}
