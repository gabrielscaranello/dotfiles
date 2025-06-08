local workarrounds = require "utils.workarrounds"

---@type LazyPluginSpec[]
return {
  { "yioneko/nvim-vtsls", opts = {}, config = function() end },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          explorer = {
            actions = {
              ["explorer_rename"] = function(picker, item, action)
                if workarrounds.is_regular_file_rename() then
                  local Actions = require "snacks.explorer.actions"
                  return Actions.actions.explorer_rename(picker, item, action)
                end

                workarrounds.typescript_rename_file(picker, item)
              end,

              ["explorer_move"] = function(picker, item, action)
                if workarrounds.is_regular_file_rename() then
                  local Actions = require "snacks.explorer.actions"
                  return Actions.actions.explorer_move(picker, item, action)
                end

                workarrounds.typescript_rename_file(picker, item)
              end,
            },
          },
        },
      },
    },
  },
}
