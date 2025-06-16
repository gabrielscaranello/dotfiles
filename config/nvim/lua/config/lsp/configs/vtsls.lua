local workarrounds = require "utils.workarrounds"

local typescript = {
  updateImportsOnFileMove = "always",
  inlayHints = {
    parameterNames = { enabled = "all" },
    parameterTypes = { enabled = true },
    variableTypes = { enabled = true },
    propertyDeclarationTypes = { enabled = true },
    functionLikeReturnTypes = { enabled = true },
    enumMemberValues = { enabled = true },
  },
}

local function get_styled_plugin()
  local npm_root_dir = vim.fn.trim(vim.fn.system "npm root -g")
  if not npm_root_dir or npm_root_dir == "" then
    return
  end

  local location = vim.fn.expand(npm_root_dir .. "/@styled/typescript-styled-plugin")
  if vim.fn.isdirectory(location) == 0 then
    return
  end

  return {
    name = "@styled/typescript-styled-plugin",
    location = location,
    configNamespace = "typescript",
    enableForWorkspaceTypeScriptVersions = true,
  }
end

local function get_global_plugins()
  local plugins = {}

  local styled_plugin = get_styled_plugin()
  if styled_plugin then
    table.insert(plugins, styled_plugin)
  end

  return plugins
end

---@type vim.lsp.Config
return {
  filetypes = workarrounds.get_ft "vtsls",
  settings = {
    typescript = typescript,
    javascript = vim.tbl_deep_extend("force", typescript, {
      inlayHints = {
        parameterNames = { enabled = "literals" },
      },
    }),
    vtsls = {
      enableMoveToFileCodeAction = false,
      tsserver = { globalPlugins = get_global_plugins() },
    },
  },
  on_attach = function(client, bufnr)
    local ok, vtsls = pcall(require, "vtsls")
    if ok then
      local vtsls_config = require("vtsls.lspconfig").default_config
      client.config = vim.tbl_extend("force", vtsls_config, client.config)

      return vtsls._on_attach(client.id, bufnr)
    end
  end,
}
