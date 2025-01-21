return {
  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter", "LspAttach" },
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {},
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "InsertEnter", "LspAttach" },
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = false,
        debounce = 150,
      },
      panel = { enabled = false },
      filetypes = { ["*"] = true },
    },
  },
}
