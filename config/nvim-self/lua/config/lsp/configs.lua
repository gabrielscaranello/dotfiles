local ts_js_settings = {
  updateImportsOnFileMove = { enabled = "always" },
  inlayHints = {
    parameterNames = { enabled = "all" },
    parameterTypes = { enabled = true },
    variableTypes = { enabled = true },
    propertyDeclarationTypes = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    enumMemberValues = { enabled = true },
  },
}

local before_init_vtsls = function(_, config)
  local registry_ok, registry = pcall(require, "mason-registry")
  if not registry_ok then return end

  local vuels = registry.get_package "vue-language-server"

  if vuels:is_installed() then
    local volar_install_path = vuels:get_install_path() .. "/node_modules/@vue/language-server"

    local vue_plugin_config = {
      name = "@vue/typescript-plugin",
      location = volar_install_path,
      languages = { "vue" },
      configNamespace = "typescript",
      enableForWorkspaceTypeScriptVersions = true,
    }

    table.insert(config.settings.vtsls.tsserver.globalPlugins, { vue_plugin_config })
  end
end

return {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        completion = { callSnippet = "Replace" },
      },
    },
  },

  gopls = {
    settings = {
      gopls = {
        analyses = {
          ST1003 = true,
          fieldalignment = false,
          fillreturns = true,
          nilness = true,
          nonewvars = true,
          shadow = true,
          undeclaredname = true,
          unreachable = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        codelenses = {
          gc_details = true,
          generate = true,
          regenerate_cgo = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        buildFlags = { "-tags", "integration" },
        completeUnimported = true,
        diagnosticsDelay = "500ms",
        gofumpt = true,
        matcher = "Fuzzy",
        semanticTokens = true,
        staticcheck = true,
        symbolMatcher = "fuzzy",
        usePlaceholders = true,
      },
    },
  },

  eslint = {
    filetypes = {
      "javascript",
      "javascript.jsx",
      "javascriptreact",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "vue",
    },
  },

  cssls = {
    init_options = { provideFormatter = false },
  },

  html = {
    init_options = { provideFormatter = false },
  },

  jsonls = {
    on_new_config = function(config)
      if not config.settings.json.schemas then config.settings.json.schemas = {} end
      vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = { json = { validate = { enable = true } } },
  },

  vtsls = {
    settings = {
      typescript = ts_js_settings,
      javascript = ts_js_settings,
      vtsls = {
        enableMoveToFileCodeAction = true,
        tsserver = {
          globalPlugins = {},
        },
      },
    },
    before_init = before_init_vtsls,
  },

  volar = {
    init_options = {
      vue = {
        hybridMode = false,
      },
    },
    settings = {
      typescript = ts_js_settings,
      javascript = ts_js_settings,
    },
  },
}
