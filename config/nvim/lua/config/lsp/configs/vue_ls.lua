local workarrounds = require "utils.workarrounds"

---@type vim.lsp.Config
return {
  filetypes = workarrounds.get_ft "vue_ls",
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}
