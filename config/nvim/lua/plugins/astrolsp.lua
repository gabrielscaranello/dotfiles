---@type LazySpec
return {
  "AstroNvim/astrolsp",
  tag = "stable",
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
      volar = { filetypes = { "vue" } },
      clangd = {
        filetypes = { "c", "cpp", "cuda", "objc", "objcpp" },
      },
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
