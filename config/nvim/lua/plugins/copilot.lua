return {
  {
    "fang2hou/blink-copilot",
    opts = {
      max_completions = 3,
      max_attempts = 2,
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    cond = vim.g.ai.provider == "copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = { markdown = true, help = true },
    },
  },
}
