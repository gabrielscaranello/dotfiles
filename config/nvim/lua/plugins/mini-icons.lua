return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = function()
    local file_utils = require "utils.file"
    local function icon(glyph, hl) return { glyph = glyph, hl = hl } end

    local eslint_icon = icon("󰱺", "MiniIconsYellow")
    local prettier_icon = icon("", "MiniIconsPurple")
    local babel_icon = icon("", "MiniIconsOrange")
    local go_icon = icon("", "MiniIconsCyan")
    local yarn_icon = icon("", "MiniIconsBlue")
    local test_js_icon = icon("󰂖", "MiniIconsOrange")
    local test_ts_icon = icon("󰂖", "MiniIconsAzure")
    local spec_js_icon = icon("󰙨", "MiniIconsYellow")
    local spec_ts_icon = icon("󰙨", "MiniIconsBlue")
    local docker_icon = icon("", "MiniIconsBlue")

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
        [".dockerignore"] = docker_icon,
        [".go-version"] = icon("", "MiniIconsBlue"),
        [".keep"] = icon("󰊢", "MiniIconsGrey"),
        [".node-version"] = icon("", "MiniIconsGreen"),
        [".yarnrc.yml"] = yarn_icon,
        ["devcontainer.json"] = icon("", "MiniIconsAzure"),
        ["docker-compose.yaml"] = docker_icon,
        ["docker-compose.yml"] = docker_icon,
        ["catalog-info.yaml"] = icon("󱉟", "MiniIconsBlue"),
        ["go.mod"] = go_icon,
        ["jest.config.js"] = icon("", "MiniIconsRed"),
        ["jest.config.ts"] = icon("", "MiniIconsRed"),
        ["package.json"] = icon("", "MiniIconsGreen"),
        ["tsconfig.build.json"] = icon("", "MiniIconsAzure"),
        ["tsconfig.json"] = icon("", "MiniIconsAzure"),
        ["webpack.config.js"] = icon("", "MiniIconsCyan"),
        ["webpack.config.ts"] = icon("", "MiniIconsCyan"),
        ["yarn.lock"] = yarn_icon,
      },
      filetype = {
        dotenv = icon("", "MiniIconsYellow"),
        go = go_icon,
        goaccess = icon("󰫴", "MiniIconsPurple"),
        godoc = icon("", "MiniIconsOrange"),
        gomod = go_icon,
        gosum = go_icon,
        gowork = icon("", "MiniIconsPurple"),
        javascriptreact = icon("", "MiniIconsYellow"),
      },
      extension = {
        [".env"] = icon("", "MiniIconsYellow"),
        ["spec.js"] = spec_js_icon,
        ["spec.jsx"] = spec_js_icon,
        ["spec.ts"] = spec_ts_icon,
        ["spec.tsx"] = spec_ts_icon,
        ["test.js"] = test_js_icon,
        ["test.jsx"] = test_js_icon,
        ["test.ts"] = test_ts_icon,
        ["test.tsx"] = test_ts_icon,
      },
    }

    -- configure prettier, eslint, and babel icons
    for _, file in pairs(file_utils.prettier_config_files) do
      opts.file[file] = prettier_icon
    end

    for _, file in pairs(file_utils.eslint_config_files) do
      opts.file[file] = eslint_icon
    end

    for _, file in pairs(file_utils.babel_config_files) do
      opts.file[file] = babel_icon
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
