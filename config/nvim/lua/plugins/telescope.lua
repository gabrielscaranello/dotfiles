---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
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
