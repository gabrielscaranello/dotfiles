---@type LazyPluginSpec
return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = function()
    local project_config = require "utils.project_config"
    local function icon(glyph, hl)
      return { glyph = glyph, hl = hl }
    end

    local babel = icon("", "MiniIconsOrange")
    local docker = icon("", "MiniIconsBlue")
    local eslint = icon("󰱺", "MiniIconsYellow")
    local go = icon("", "MiniIconsCyan")
    local jest = icon("", "MiniIconsRed")
    local prettier = icon("", "MiniIconsPurple")
    local spec_js = icon("󰙨", "MiniIconsYellow")
    local spec_ts = icon("󰙨", "MiniIconsBlue")
    local test_js = icon("󰂖", "MiniIconsOrange")
    local test_ts = icon("󰂖", "MiniIconsAzure")
    local vite = icon("", "MiniIconsGreen")
    local vitest = icon("", "MiniIconsGreen")
    local yarn = icon("", "MiniIconsBlue")

    local opts = {
      directory = {
        assets = icon("󰉏", "MiniIconsAzure"),
        config = icon("󱁿", "MiniIconsAzure"),
        configs = icon("󱁿", "MiniIconsAzure"),
        services = icon("󱁿", "MiniIconsYellow"),
        test = icon("󱞊", "MiniIconsBlue"),
        tests = icon("󱞊", "MiniIconsBlue"),
        util = icon("󱧼", "MiniIconsAzure"),
        utils = icon("󱧼", "MiniIconsAzure"),
      },
      file = {
        [".go-version"] = icon("", "MiniIconsBlue"),
        [".keep"] = icon("󰊢", "MiniIconsGrey"),
        [".node-version"] = icon("", "MiniIconsGreen"),
        [".yarnrc.yml"] = yarn,
        ["devcontainer.json"] = icon("", "MiniIconsAzure"),
        ["catalog-info.yaml"] = icon("󱉟", "MiniIconsBlue"),
        ["go.mod"] = go,
        ["package.json"] = icon("", "MiniIconsGreen"),
        ["tsconfig.build.json"] = icon("", "MiniIconsAzure"),
        ["tsconfig.json"] = icon("", "MiniIconsAzure"),
        ["webpack.config.js"] = icon("", "MiniIconsCyan"),
        ["webpack.config.ts"] = icon("", "MiniIconsCyan"),
        ["yarn.lock"] = yarn,
      },
      filetype = {
        dotenv = icon("", "MiniIconsYellow"),
        go = go,
        goaccess = icon("󰫴", "MiniIconsPurple"),
        godoc = icon("", "MiniIconsOrange"),
        gomod = go,
        gosum = go,
        gowork = icon("", "MiniIconsPurple"),
        javascriptreact = icon("", "MiniIconsYellow"),
      },
      extension = {
        [".env"] = icon("", "MiniIconsYellow"),
        ["spec.js"] = spec_js,
        ["spec.jsx"] = spec_js,
        ["spec.ts"] = spec_ts,
        ["spec.tsx"] = spec_ts,
        ["test.js"] = test_js,
        ["test.jsx"] = test_js,
        ["test.ts"] = test_ts,
        ["test.tsx"] = test_ts,
      },
    }

    --- configure icons with multiple config files
    local bulk_files = {
      babel = babel,
      docker = docker,
      eslint = eslint,
      jest = jest,
      prettier = prettier,
      vite = vite,
      vitest = vitest,
    }

    for item, icon_opts in pairs(bulk_files) do
      local files = project_config[item]
      for _, file in pairs(files) do
        opts.file[file] = icon_opts
      end
    end

    return opts
  end,
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
