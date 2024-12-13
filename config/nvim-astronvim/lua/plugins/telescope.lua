---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        ".git",
        "dist",
        "node_modules",
        "vendor",
        "yarn.lock",
      },
    },
  },
}
