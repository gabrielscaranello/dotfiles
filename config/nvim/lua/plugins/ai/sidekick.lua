---@type LazyPluginSpec
return {
  "folke/sidekick.nvim",
  version = "v2.1",
  cond = require("utils.ai").is_copilot_provider(),

  ---@type sidekick.Config
  opts = {
    copilot = { status = { enabled = false } },
    nes = { enabled = false },
    cli = {
      win = {
        split = { width = 60 },
      },
      tools = {
        copilot = { cmd = { "copilot" } },
      },
    },
  },
  keys = {
    {
      "<leader>aa",
      function()
        local name = require("utils.ai").get_provider()
        require("sidekick.cli").toggle(name)
      end,
      desc = "Toggle CLI",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select { filter = { installed = true } }
      end,
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send { msg = "{this}" }
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send { msg = "{file}" }
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send { msg = "{selection}" }
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}
