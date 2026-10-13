---@type LazyPluginSpec[]
return {
  {
    "folke/lazydev.nvim",
    version = "^v1.10",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "Lazy" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
}
