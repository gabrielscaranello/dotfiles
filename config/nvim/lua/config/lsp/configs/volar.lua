local shared = require "config.lsp.configs._shared"

return {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  settings = {
    typescript = shared.ts_js_settings,
    javascript = shared.ts_js_settings,
  },
}
