---@type LazySpec
return {
  "AstroNvim/astrolsp",
  tag = "stable",
  pin = true,

  ---@type AstroLSPOpts
  opts = {
    ---@type any
    config = {
      eslint = {
        filetypes = {
          "javascript",
          "javascript.jsx",
          "javascriptreact",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
          "vue",
        },
      },
      clangd = {
        filetypes = { "c", "cpp", "cuda", "objc", "objcpp" },
      },
    },

    formatting = {
      async = false,
      format_on_save = { enabled = true },

      filter = function(client)
        local ignored_clients = { "jsonls", "tsserver", "vtsls", "volar" }

        for _, client_name in ipairs(ignored_clients) do
          if client_name == client.name then return false end
        end

        return true
      end,
    },
  },
}
