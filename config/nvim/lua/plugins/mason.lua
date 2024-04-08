---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bufls",
        "volar@1.8.27",
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "checkmake",
        "editorconfig_checker",
        "jq",
        "jsonlint",
      })
    end,
  },

  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {})
  --   end,
  -- },
}
