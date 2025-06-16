local icons = require "utils.icons"
local cmp_config = require "config.cmp"

---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = {
    "bydlw98/blink-cmp-env",
    "moyiz/blink-emoji.nvim",
    "rafamadriz/friendly-snippets",
    { "saghen/blink.compat", opts = {}, version = "2.*" },
  },

  opts_extend = {
    "sources.compat",
    "sources.default",
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    cmdline = { enabled = false },
    snippets = { preset = "default" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
      kind_icons = icons.kinds,
    },

    completion = {
      list = {
        max_items = 50,
        selection = { preselect = true, auto_insert = true },
      },
      ghost_text = { enabled = false },
      accept = {
        auto_brackets = { enabled = true },
        create_undo_point = true,
      },

      menu = {
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline"
        end,
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        draw = { treesitter = { "lsp" } },
      },

      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
      use_frecency = false,
      use_proximity = false,
      sorts = { "exact", cmp_config.underscore_last, "score" },
    },

    signature = {
      window = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },

    sources = {
      default = { "lsp", "snippets", "path", "buffer", "emoji", "env" },
      providers = {
        lsp = {
          transform_items = function(_, items)
            return vim.tbl_filter(function(item)
              if item.client_name == "emmet_ls" then
                return true
              end
              return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
            end, items)
          end,
        },
        env = {
          name = "Env",
          module = "blink-cmp-env",
          score_offset = -1,
          max_items = 5,
          opts = { show_braces = false, show_documentation_window = true },
        },
        path = { score_offset = -1 },
        emoji = { name = "emoji", score_offset = -1, module = "blink-emoji" },
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

  config = function(_, opts)
    -- setup compat sources
    local enabled = opts.sources.default
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
        table.insert(enabled, source)
      end
    end

    -- check if need override kind icon
    for _, provider in pairs(opts.sources.providers or {}) do
      ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
      if provider.kind then
        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
        local kind_idx = #CompletionItemKind + 1

        CompletionItemKind[kind_idx] = provider.kind
        ---@diagnostic disable-next-line: no-unknown
        CompletionItemKind[provider.kind] = kind_idx

        ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
        local transform_items = provider.transform_items
        ---@param ctx blink.cmp.Context
        ---@param items blink.cmp.CompletionItem[]
        provider.transform_items = function(ctx, items)
          items = transform_items and transform_items(ctx, items) or items
          for _, item in ipairs(items) do
            item.kind = kind_idx or item.kind
            item.kind_icon = icons.kinds[item.kind_name] or item.kind_icon or nil
          end
          return items
        end

        -- Unset custom prop to pass blink.cmp validation
        provider.kind = nil
      end
    end

    require("blink.cmp").setup(opts)
  end,
}
