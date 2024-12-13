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
  netrw_liststyle = 3,
  mapleader = " ",
}

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
}

for key, value in pairs(opts) do
  vim.opt[key] = value
end

for key, value in pairs(global_vars) do
  vim.g[key] = value
end
