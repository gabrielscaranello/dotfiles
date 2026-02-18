---@type LazyPluginSpec
return {
  "folke/sidekick.nvim",
  version = "v2.1",
  cond = require("utils.ai").is_copilot_provider(),

  opts = function()
    local ai = require "utils.ai"

    local get_copilot_cmd = function()
      local cmd = { "copilot", "--silent" }
      local copilot_model = ai.get_copilot_model()

      if copilot_model then
        vim.list_extend(cmd, { "--model", copilot_model })
      end

      return cmd
    end

    ---@type sidekick.Config
    return {
      copilot = { status = { enabled = false } },
      nes = { enabled = false },
      cli = {
        win = {
          split = { width = 60 },
        },
        tools = {
          copilot = { cmd = get_copilot_cmd() },
        },
      },
    }
  end,
  keys = function()
    local provider = require("utils.ai").get_provider()

    return {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle(provider)
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
          require("sidekick.cli").send { msg = "{this}", name = provider }
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send { msg = "{file}", name = provider }
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send { msg = "{selection}", name = provider }
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
    }
  end,
}
