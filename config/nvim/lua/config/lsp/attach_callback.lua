local keymap = require "utils.keymap"
local lsp_utils = require "utils.lsp"

local function has_capability(client, capability) return client.server_capabilities[capability] == true end

local capabilities_actions_map = {
  definitionProvider = {
    mode = "n",
    key = "gd",
    action = function() Snacks.picker.lsp_definitions() end,
    desc = "Goto Definition",
  },
  referencesProvider = {
    mode = "n",
    key = "gr",
    action = function() Snacks.picker.lsp_references() end,
    desc = "References",
    opts = { nowait = true },
  },
  implementationProvider = {
    mode = "n",
    key = "gI",
    action = function() Snacks.picker.lsp_implementations() end,
    desc = "Goto Implementation",
  },
  typeDefinitionProvider = {
    mode = "n",
    key = "gy",
    action = function() Snacks.picker.lsp_type_definitions() end,
    desc = "Goto Type Definition",
  },
  declarationProvider = {
    mode = "n",
    key = "gD",
    action = vim.lsp.buf.declaration,
    desc = "Goto Declaration",
  },
}

return function(event)
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
    { "n", "<leader>lk", lsp_utils.clients.restart, with_opts { desc = "Restart LSP" } },
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
