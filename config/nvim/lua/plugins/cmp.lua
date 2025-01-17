return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-emoji",
      "brenoprata10/nvim-highlight-colors",
      "SergioRibera/cmp-dotenv",
    },

    opts = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"
      local icons = require "utils.icons"
      local highlight_colors = require "nvim-highlight-colors"

      ---@type cmp.ConfigSchema
      return {
        completion = {
          completeopt = "menu,menuone,noselect",
        },

        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },

        window = {
          completion = cmp.config.window.bordered {
            col_offset = -2,
            max_width = 15,
            scrollbar = true,
            scrolloff = 5,
            side_padding = 1,
          },
          documentation = cmp.config.window.bordered {
            max_height = 20,
            max_width = 20,
          },
        },

        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        sources = {
          { name = "codeium", group_index = 1 },
          { name = "nvim_lsp", group_index = 1 },
          { name = "luasnip", group_index = 1 },
          { name = "dotenv", group_index = 2 },
          { name = "buffer", group_index = 2 },
          { name = "path", group_index = 2 },
          { name = "emoji", group_index = 3 },
        },

        formatting = {
          expandable_indicator = true,
          fields = { "kind", "abbr", "menu" },
          format = function(entry, item)
            local color_item = highlight_colors.format(entry, { kind = item.kind })

            item = lspkind.cmp_format {
              mode = "symbol",
              maxwidth = 25,
              ellipsis_char = "...",
              preset = "codicons",
              symbol_map = icons.kinds,
            }(entry, item)

            if color_item and color_item.abbr_hl_group then
              item.kind_hl_group = color_item.abbr_hl_group
              item.kind = color_item.abbr
            end

            return item
          end,
        },
      }
    end,
  },
}
