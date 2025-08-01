---@type LazyPluginSpec
return {
  "monaqa/dial.nvim",

  keys = {
    {
      "<C-a>",
      function()
        return require("dial.map").manipulate("increment", "normal")
      end,
      desc = "Increment",
    },
    {
      "<C-x>",
      function()
        return require("dial.map").manipulate("decrement", "normal")
      end,
      desc = "Decrement",
    },
    {
      "g<C-a>",
      function()
        return require("dial.map").manipulate("increment", "gnormal")
      end,
      desc = "Increment",
    },
    {
      "g<C-x>",
      function()
        return require("dial.map").manipulate("decrement", "gnormal")
      end,
      desc = "Decrement",
    },
    {
      "<C-a>",
      function()
        return require("dial.map").manipulate("increment", "visual")
      end,
      mode = { "v" },
      desc = "Increment",
    },
    {
      "<C-x>",
      function()
        return require("dial.map").manipulate("decrement", "visual")
      end,
      mode = { "v" },
      desc = "Decrement",
    },
    {
      "g<C-a>",
      function()
        return require("dial.map").manipulate("increment", "gvisual")
      end,
      mode = { "x" },
      desc = "Increment",
    },
    {
      "g<C-x>",
      function()
        return require("dial.map").manipulate("decrement", "gvisual")
      end,
      mode = { "x" },
      desc = "Decrement",
    },
  },

  config = function()
    local augend = require "dial.augend"
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.bool,
        augend.semver.alias.semver,
        augend.date.new {
          pattern = "%B", -- titlecased month names
          default_kind = "day",
        },
        augend.constant.new {
          elements = {
            "january",
            "february",
            "march",
            "april",
            "may",
            "june",
            "july",
            "august",
            "september",
            "october",
            "november",
            "december",
          },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = {
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
            "Sunday",
          },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = {
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
            "saturday",
            "sunday",
          },
          word = true,
          cyclic = true,
        },
        augend.case.new {
          types = {
            "camelCase",
            "PascalCase",
            "snake_case",
            "SCREAMING_SNAKE_CASE",
          },
        },
      },
    }
  end,
}
