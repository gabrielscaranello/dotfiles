return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
  },

  config = function(_, opts)
    local autopairs = require "nvim-autopairs"
    local cmp = require "cmp"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"

    autopairs.setup(opts)
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
