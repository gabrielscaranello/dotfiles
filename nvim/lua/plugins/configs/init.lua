local sources = {
    "bufferline", "cmp", "filetype", "fix-cursor-hold", "gitsigns", "icons",
    "lsp", "lsp.lspsaga", "lua-snip", "lualine", "null-ls", "nvim-tree",
    "symbols-outline", "treesitter", "telescope", "dashboard", "colorizer",
    "autopairs", "toggleterm", "impatient", "comment", "indent-line",
    "which-key", "neoscroll", "tabnine", "notify"
}

local M = {}

for _, source in ipairs(sources) do
    M[source] = require("plugins.configs." .. source).config
end

return M
