local icons = require "utils.icons"

local opts = {
  -- line numbers
  relativenumber = true,
  number = true,

  -- tabs and indentation
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- editing
  wrap = true,
  scrolloff = 8,
  mouse = "a",
  undofile = true,

  -- appearance
  termguicolors = true,
  background = "dark",
  signcolumn = "yes",
  cursorline = true,
  cmdheight = 0,

  -- backspace
  backspace = "indent,eol,start",

  -- search settings
  ignorecase = true,
  smartcase = true,

  -- clipboard
  clipboard = "unnamedplus",

  -- split windows
  splitbelow = true,
  splitright = true,
}

local global_vars = {
  editorconfig = true,
  netrw_liststyle = 3,
  mapleader = " ",

  loaded_perl_provider = 0,
  loaded_python3_provider = 0,
  loaded_ruby_provider = 0,

  ai = {
    provider = vim.env.AI_PROVIDER or "codeium",
    use_copilot_chat = vim.env.USE_COPILOT_CHAT or false,
  },
}

vim.diagnostic.config {
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
    },
  },
}

vim.o.timeout = true
vim.o.timeoutlen = 400
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

for key, value in pairs(opts) do
  vim.opt[key] = value
end

for key, value in pairs(global_vars) do
  vim.g[key] = value
end
