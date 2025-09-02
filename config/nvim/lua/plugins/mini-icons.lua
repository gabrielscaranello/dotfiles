---@type LazyPluginSpec
return {
  "nvim-mini/mini.icons",
  lazy = true,
  opts = function()
    local project_config = require "utils.project_config"
    local function icon(glyph, hl)
      return { glyph = glyph, hl = hl }
    end

    local babel = icon("", "MiniIconsOrange")
    local docker = icon("", "MiniIconsBlue")
    local dotenv = icon("", "MiniIconsYellow")
    local dotenv_alt = icon("", "MiniIconsGrey")
    local eslint = icon("󰱺", "MiniIconsYellow")
    local go = icon("", "MiniIconsCyan")
    local jest = icon("", "MiniIconsRed")
    local kitty = icon("󱁻", "MiniIconsYellow")
    local prettier = icon("", "MiniIconsPurple")
    local spec_js = icon("󰙨", "MiniIconsYellow")
    local spec_ts = icon("󰙨", "MiniIconsBlue")
    local test_js = icon("󰂖", "MiniIconsOrange")
    local test_ts = icon("󰂖", "MiniIconsAzure")
    local tsconfig = icon("", "MiniIconsAzure")
    local vite = icon("", "MiniIconsGreen")
    local vitest = icon("", "MiniIconsGreen")
    local webpack = icon("", "MiniIconsCyan")
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
        [".env"] = dotenv,
        [".go-version"] = icon("", "MiniIconsBlue"),
        [".keep"] = icon("󰊢", "MiniIconsGrey"),
        [".node-version"] = icon("", "MiniIconsGreen"),
        [".yarnrc.yml"] = yarn,
        ["catalog-info.yaml"] = icon("󱉟", "MiniIconsBlue"),
        ["devcontainer.json"] = icon("", "MiniIconsAzure"),
        ["go.mod"] = go,
        ["kitty.conf"] = kitty,
        ["package.json"] = icon("", "MiniIconsGreen"),
        ["yarn.lock"] = yarn,
      },
      filetype = {
        dotenv = dotenv,
        go = go,
        goaccess = icon("󰫴", "MiniIconsPurple"),
        godoc = icon("", "MiniIconsOrange"),
        gomod = go,
        gosum = go,
        gowork = icon("", "MiniIconsPurple"),
        javascriptreact = icon("", "MiniIconsYellow"),
      },
      extension = {
        [".env"] = dotenv,
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
      dotenv = dotenv_alt,
      eslint = eslint,
      jest = jest,
      prettier = prettier,
      tsconfig = tsconfig,
      vite = vite,
      vitest = vitest,
      webpack = webpack,
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
