local keymap = require "utils.keymap"

local function has_capability(client, capability) return client.server_capabilities[capability] == true end

local capabilities_actions_map = {
  definitionProvider = {
    mode = "n",
    key = "gd",
    action = function() require("telescope.builtin").lsp_definitions { reuse_win = true, show_line = false } end,
    desc = "Goto Definition",
  },
  referencesProvider = {
    mode = "n",
    key = "gr",
    action = function() require("telescope.builtin").lsp_references { reuse_win = true, show_line = false } end,
    desc = "References",
    opts = { nowait = true },
  },
  implementationProvider = {
    mode = "n",
    key = "gI",
    action = function() require("telescope.builtin").lsp_implementations { reuse_win = true, show_line = false } end,
    desc = "Goto Implementation",
  },
  typeDefinitionProvider = {
    mode = "n",
    key = "gy",
    action = function() require("telescope.builtin").lsp_type_definitions { reuse_win = true, show_line = false } end,
    desc = "Goto Type Definition",
  },
  declarationProvider = {
    mode = "n",
    key = "gD",
    action = vim.lsp.buf.declaration,
    desc = "Goto Declaration",
  },
}

local attach_callback = function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  local function with_opts(opts)
    opts.buffer = event.buf
    opts.silent = opts.silent or true
    return opts
  end

  local keymaps = {
    { "n", "K", vim.lsp.buf.hover, with_opts { desc = "Hover" } },
    { "n", "gK", vim.lsp.buf.signature_help, with_opts { desc = "Signature Help" } },
    { "i", "<c-l>", vim.lsp.buf.hover, with_opts { desc = "Hover" } },
    { { "n", "v" }, "<leader>la", vim.lsp.buf.code_action, with_opts { desc = "Code Action" } },
    { "n", "<leader>lr", vim.lsp.buf.rename, with_opts { desc = "Rename" } },
    {
      "n",
      "<leader>ld",
      function()
        vim.diagnostic.open_float(
          nil,
          { focusable = true, border = "rounded", source = "always", prefix = "", scope = "line", header = "" }
        )
      end,
      with_opts { desc = "Diagnostics" },
    },
    { "n", "<leader>lk", "<cmd>LspRestart<cr>", with_opts { desc = "Restart LSP" } },
    { "n", "<leader>li", "<cmd>LspInfo<cr>", with_opts { desc = "LSP Info" } },
  }

  for capability, mapping in pairs(capabilities_actions_map) do
    if has_capability(client, capability) then
      table.insert(keymaps, {
        mapping.mode,
        mapping.key,
        mapping.action,
        with_opts(vim.tbl_deep_extend("force", { desc = mapping.desc }, mapping.opts or {})),
      })
    end
  end

  keymap.map(keymaps)
end

return function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(...) attach_callback(...) end,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("ESLintFixOnSave", { clear = true }),
    pattern = "*.js,*.jsx,*.mjs,*.mts,*.ts,*.tsx,*.vue",
    callback = function()
      if vim.fn.exists ":EslintFixAll" > 0 then
        vim.cmd.EslintFixAll()
        vim.cmd.w()
      end
    end,
  })
end
