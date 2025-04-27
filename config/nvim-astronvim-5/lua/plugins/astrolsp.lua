---@type LazySpec
return {
  "AstroNvim/astrolsp",

  ---@type AstroLSPOpts
  opts = {

    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        filetypes = { "c", "cpp", "cuda", "objc", "objcpp" },
      },
    },

    formatting = {
      format_on_save = {
        enabled = true,
      },

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
