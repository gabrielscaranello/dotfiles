---@type table<string,vim.lsp.Config>
return {
  buf_ls = require "config.lsp.configs.buf_ls",
  clangd = require "config.lsp.configs.clangd",
  cssls = require "config.lsp.configs.cssls",
  eslint = require "config.lsp.configs.eslint",
  graphql = require "config.lsp.configs.graphqlls",
  html = require "config.lsp.configs.htmlls",
  jsonls = require "config.lsp.configs.jsonls",
  lua_ls = require "config.lsp.configs.lua_ls",
  pbls = require "config.lsp.configs.pbls",
  vtsls = require "config.lsp.configs.vtsls",
  yamlls = require "config.lsp.configs.yamlls",
}
