return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {
    directory = {
      assets = { glyph = "󰉏", hl = "MiniIconsAzure" },
      config = { glyph = "󱁿", hl = "MiniIconsAzure" },
      configs = { glyph = "󱁿", hl = "MiniIconsAzure" },
      services = { glyph = "󱁿", hl = "MiniIconsYellow" },
      test = { glyph = "󱞊", hl = "MiniIconsBlue" },
      tests = { glyph = "󱞊", hl = "MiniIconsBlue" },
      util = { glyph = "󱧼", hl = "MiniIconsAzure" },
      utils = { glyph = "󱧼", hl = "MiniIconsAzure" },
    },
    file = {
      [".eslintrc"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
      [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
      [".eslintrc.json"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
      [".eslintrc.ts"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
      [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
      [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
      [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
      [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
      ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
      ["eslint.config.ts"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
      ["go.mod"] = { glyph = "", hl = "MiniIconsCyan" },
      ["jest.config.js"] = { glyph = "", hl = "MiniIconsRed" },
      ["jest.config.ts"] = { glyph = "", hl = "MiniIconsRed" },
      ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
      ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
      ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
      ["webpack.config.js"] = { glyph = "", hl = "MiniIconsCyan" },
      ["webpack.config.ts"] = { glyph = "", hl = "MiniIconsCyan" },
      ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
    },
    filetype = {
      dotenv = { glyph = "", hl = "MiniIconsYellow" },
      go = { glyph = "", hl = "MiniIconsCyan" },
      goaccess = { glyph = "󰫴", hl = "MiniIconsPurple" },
      godoc = { glyph = "", hl = "MiniIconsOrange" },
      gomod = { glyph = "", hl = "MiniIconsCyan" },
      gosum = { glyph = "", hl = "MiniIconsCyan" },
      gowork = { glyph = "", hl = "MiniIconsPurple" },
      javascriptreact = { glyph = "", hl = "MiniIconsYellow" },
    },

    extension = {
      [".env"] = { glyph = "", hl = "MiniIconsYellow" },
      ["spec.js"] = { glyph = "󰙨", hl = "MiniIconsYellow" },
      ["spec.jsx"] = { glyph = "󰙨", hl = "MiniIconsYellow" },
      ["spec.ts"] = { glyph = "󰙨", hl = "MiniIconsBlue" },
      ["spec.tsx"] = { glyph = "󰙨", hl = "MiniIconsBlue" },
      ["test.js"] = { glyph = "󰂖", hl = "MiniIconsOrange" },
      ["test.jsx"] = { glyph = "󰂖", hl = "MiniIconsOrange" },
      ["test.ts"] = { glyph = "󰂖", hl = "MiniIconsAzure" },
      ["test.tsx"] = { glyph = "󰂖", hl = "MiniIconsAzure" },
    },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
