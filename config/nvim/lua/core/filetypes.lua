vim.filetype.add {
  extension = {
    graphqls = "graphql",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
}
