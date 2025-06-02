local icons = require "utils.icons"

return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    build = "cargo build --release",
    dependencies = {
      "Exafunction/codeium.nvim",
      "bydlw98/blink-cmp-env",
      "moyiz/blink-emoji.nvim",
      { "saghen/blink.compat", opts = {}, version = "2.*" },
      { "L3MON4D3/LuaSnip", version = "v2.*" },
    },

    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = { enabled = false },
      snippets = { preset = "luasnip" },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
        kind_icons = icons.kinds,
      },

      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        ghost_text = { enabled = false },
        accept = { auto_brackets = { enabled = true } },

        menu = {
          auto_show = function(ctx) return ctx.mode ~= "cmdline" end,
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          draw = { treesitter = { "lsp" } },
        },

        documentation = {
          auto_show = false,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          },
        },
      },

      signature = {
        window = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        },
      },

      sources = {
        default = { vim.g.ai_provider, "lsp", "snippets", "path", "buffer", "emoji", "env" },
        providers = {
          emoji = { name = "emoji", module = "blink-emoji" },
          codeium = {
            enabled = vim.g.ai_provider == "codeium",
            name = "Codeium",
            module = "codeium.blink",
            max_items = 3,
            async = true,
          },
          env = {
            name = "Env",
            module = "blink-cmp-env",
            opts = { show_braces = false, show_documentation_window = true },
          },
        },
      },

      keymap = {
        preset = "enter",
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-e>"] = { "cancel" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        ["<C-l>"] = { "show_documentation" },
        ["<C-h>"] = { "hide_documentation" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
    },
  },
}
