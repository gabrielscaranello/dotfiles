---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
      eslint = {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      },
      volar = { filetypes = { "vue" } },
      tsserver = {
        filetypes = {
          "javascript",
          "javascript.jsx",
          "javascriptreact",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
        },
      },
      clangd = { filetypes = { "c", "cpp", "objc", "objcpp", "cuda" } },
    },

    formatting = {
      async = false,
      format_on_save = { enabled = true },

      filter = function(client)
        if client.name == "jsonls" then return false end
        if client.name == "tsserver" then return false end
        if client.name == "volar" then return false end

        return true
      end,
    },
  },
}
