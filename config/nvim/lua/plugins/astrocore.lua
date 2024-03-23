local make_mappings = function()
  local astrocore = require "astrocore"
  local buffer = require "astrocore.buffer"

  local mappings = {
    n = {
      [";"] = { ":", desc = "Call :" },
      ["<leader><space>"] = { "<cmd>noh<cr>", desc = "No highlight" },
      ["L"] = {
        function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["H"] = {
        function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
      ["<leader>lk"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
      ["<leader>gD"] = { "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      ["<leader>gx"] = { "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      ["d"] = { '"_d' },
      ["c"] = { '"_c' },
    },
    v = {
      ["d"] = { '"_d' },
      ["c"] = { '"_c' },
    },
    t = {},
    i = {
      ["<C-s>"] = { "<Esc><cmd>w<cr>", desc = "Write file" },
    },
  }

  if vim.fn.executable "lazydocker" == 1 then
    mappings.n["<leader>td"] = { function() astrocore.toggle_term_cmd "lazydocker" end, desc = "ToggleTerm lazydocker" }
  end

  return mappings
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    diagnostics = {
      virtual_text = false,
      underline = true,
    },

    mappings = make_mappings(),

    features = {
      autopairs = true,
      cmp = true,
      diagnostics_mode = 2,
      notifications = true,
    },

    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "auto",
        wrap = true,
        guicursor = "n-v-c-i:ver100-iCursor",
        cursorline = true,
        clipboard = "unnamedplus",
      },
    },
  },
}
