return {
  "rest-nvim/rest.nvim",
  ft = "http",
  cmd = "Rest",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "json" },
      callback = function() vim.api.nvim_set_option_value("formatprg", "jq", { scope = "local" }) end,
    })
  end,
  config = function()
    local keymap = require "utils.keymap"

    local function set_http_keymaps()
      keymap.map {
        { "n", "<leader>hr", "<cmd>Rest run<cr>", { desc = "Run request under the cursor" } },
        { "n", "<leader>hl", "<cmd>Rest last<cr>", { desc = "Run last request" } },
        { "n", "<leader>he", "<cmd>Rest env select<cr>", { desc = "Select environment variables file" } },
      }
    end

    local function unset_http_keymaps()
      local keys = { "<leader>hr", "<leader>hl", "<leader>he" }

      for _, key in pairs(keys) do
        if vim.fn.mapcheck(key, "n") ~= "" then pcall(vim.api.nvim_del_keymap, "n", key) end
      end
    end

    local pattern = "*.http"
    vim.api.nvim_create_autocmd("BufEnter", { pattern = pattern, callback = set_http_keymaps })
    vim.api.nvim_create_autocmd("BufLeave", { pattern = pattern, callback = unset_http_keymaps })
  end,
}
