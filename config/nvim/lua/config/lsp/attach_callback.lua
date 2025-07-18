local keymap = require "utils.keymap"
local lsp_utils = require "utils.lsp"

---@param client vim.lsp.Client
---@param capability string
local function has_capability(client, capability)
  return client.server_capabilities[capability] == true
end

---@type table<string, {mode: string|string[], key: string, desc: string, action: function|string, opts?: vim.keymap.set.Opts}>
local capabilities_actions_map = {
  definitionProvider = {
    mode = "n",
    key = "gd",
    desc = "Goto Definition",
    action = function()
      Snacks.picker.lsp_definitions()
    end,
  },

  referencesProvider = {
    mode = "n",
    key = "gr",
    desc = "References",
    opts = { nowait = true },
    action = function()
      Snacks.picker.lsp_references()
    end,
  },

  implementationProvider = {
    mode = "n",
    key = "gI",
    desc = "Goto Implementation",
    action = function()
      Snacks.picker.lsp_implementations()
    end,
  },

  typeDefinitionProvider = {
    mode = "n",
    key = "gy",
    desc = "Goto Type Definition",
    action = function()
      Snacks.picker.lsp_type_definitions()
    end,
  },

  declarationProvider = {
    mode = "n",
    key = "gD",
    desc = "Goto Declaration",
    action = vim.lsp.buf.declaration,
  },
}

return function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if not client then
    return
  end

  ---@param opts vim.keymap.set.Opts
  ---@return vim.keymap.set.Opts
  local function with_opts(opts)
    opts.buffer = event.buf
    opts.silent = opts.silent or true
    return opts
  end

  local keymaps = {
    { "n", "K", vim.lsp.buf.hover, with_opts { desc = "Hover" } },
    {
      "n",
      "gK",
      vim.lsp.buf.signature_help,
      with_opts { desc = "Signature Help" },
    },
    { "i", "<c-l>", vim.lsp.buf.hover, with_opts { desc = "Hover" } },
    {
      { "n", "v" },
      "<leader>la",
      vim.lsp.buf.code_action,
      with_opts { desc = "Code Action" },
    },
    { "n", "<leader>lr", vim.lsp.buf.rename, with_opts { desc = "Rename" } },
    {
      "n",
      "<leader>ld",
      function()
        vim.diagnostic.open_float(nil, {
          focusable = true,
          border = "rounded",
          source = "always",
          prefix = "",
          scope = "line",
          header = "",
        })
      end,
      with_opts { desc = "Diagnostics" },
    },
    {
      "n",
      "<leader>lk",
      lsp_utils.clients.restart,
      with_opts { desc = "Restart LSP" },
    },
    { "n", "<leader>li", "<cmd>LspInfo<cr>", with_opts { desc = "LSP Info" } },
  }

  for capability, mapping in pairs(capabilities_actions_map) do
    if has_capability(client, capability) then
      local opts = mapping.opts or {}
      opts = vim.tbl_deep_extend("force", opts, { desc = mapping.desc })
      local map = { mapping.mode, mapping.key, mapping.action, with_opts(opts) }
      table.insert(keymaps, map)
    end
  end

  keymap.map(keymaps)
end
