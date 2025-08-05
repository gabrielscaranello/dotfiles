---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",

  ---@type CatppuccinOptions
  opts = {
    transparent_background = true,
    kitty = true,
    show_end_of_buffer = false,
    flavour = "mocha",
    float = {
      transparent = true,
      solid = false,
    },
    integrations = {
      blink_cmp = { style = "bordered" },
      flash = true,
      gitsigns = { enabled = true, transparent = true },
      grug_far = true,
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = { enabled = true, indentscope_color = "blue" },
      native_lsp = { enabled = true },
      noice = true,
      render_markdown = true,
      snacks = { enabled = true, indent_scope_color = "blue" },
      treesitter = true,
      which_key = true,
    },
    custom_highlights = function(C)
      local O = require("catppuccin").options
      return {
        ["@constructor"] = { fg = C.sapphire },
        ["@constructor.lua"] = { fg = C.flamingo },
        ["@keyword.export"] = { fg = C.sky, style = O.styles.keywords },
        ["@keyword.operator"] = { link = "Operator" },
        ["@markup.heading"] = { fg = C.blue, style = { "bold" } },
        ["@markup.italic"] = { fg = C.maroon, style = { "italic" } },
        ["@markup.link"] = { link = "Tag" },
        ["@markup.link.label"] = { link = "Label" },
        ["@markup.link.url"] = { fg = C.rosewater, style = { "italic", "underline" } },
        ["@markup.list"] = { link = "Special" },
        ["@markup.quote"] = { fg = C.maroon, style = { "bold" } },
        ["@markup.raw"] = { fg = C.teal },
        ["@markup.strong"] = { fg = C.maroon, style = { "bold" } },
        ["@module"] = { fg = C.lavender, style = O.styles.miscs or { "italic" } },
        ["@property"] = { fg = C.lavender, style = O.styles.properties or {} },
        ["@property.css"] = { fg = C.lavender },
        ["@property.id.css"] = { fg = C.blue },
        ["@string.plain.css"] = { fg = C.peach },
        ["@string.special.url"] = { fg = C.rosewater, style = { "italic", "underline" } },
        ["@tag"] = { fg = C.mauve },
        ["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },
        ["@tag.delimiter"] = { fg = C.sky },
        ["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } },
        ["@type.tag.css"] = { fg = C.mauve },
        ["@variable.member"] = { fg = C.lavender },
        -- typescript
        ["@constructor.typescript"] = { fg = C.lavender },
        ["@property.typescript"] = { fg = C.lavender, style = O.styles.properties or {} },
        -- TSX (Typescript React)
        ["@constructor.tsx"] = { fg = C.lavender },
        ["@tag.attribute.tsx"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },
        ["@tag.builtin"] = { fg = C.mauve },
        ["@type.builtin.c"] = { fg = C.yellow, style = {} },
        ["@type.builtin.cpp"] = { fg = C.yellow, style = {} },
      }
    end,
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
