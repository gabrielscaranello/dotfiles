vim.filetype.add {
  extension = {
    graphqls = "graphql",
  },
  pattern = {
    [".*/kitty/.+%.conf"] = "kitty",
    ["%.env%.[%w_.-]+"] = "dotenv",
    [".env"] = "dotenv",
  },
}
