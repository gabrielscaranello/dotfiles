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

  completion_ai = "codeium",
}

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
}

vim.o.timeout = true
vim.o.timeoutlen = 400

for key, value in pairs(opts) do
  vim.opt[key] = value
end

for key, value in pairs(global_vars) do
  vim.g[key] = value
end
