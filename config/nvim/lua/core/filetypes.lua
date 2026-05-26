vim.filetype.add {
  extension = {
    graphqls = "graphql",
    pcss = "postcss",
    postcss = "postcss",
  },
  filename = {
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
    [".env"] = "dotenv",
  },
  pattern = {
    [".*/kitty/.+%.conf"] = "kitty",
    ["%.env%.[%w_.-]+"] = "dotenv",
    [".env"] = "dotenv",
  },
}
