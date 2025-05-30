local shared = require "config.lsp.configs._shared"

---@type vim.lsp.Config
return {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  settings = {
    typescript = shared.volar_ts_js_settings,
    javascript = shared.volar_ts_js_settings,
  },
}
