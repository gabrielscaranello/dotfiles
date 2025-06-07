local file_utils = require "utils.file"

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
                if not file_utils.is_tsjs_project() then
                  local Actions = require "snacks.explorer.actions"
                  return Actions.actions.explorer_rename(picker, item, action)
                end

                file_utils.typescript_rename_file(picker, item)
              end,

              ["explorer_move"] = function(picker, item, action)
                if not file_utils.is_tsjs_project() then
                  local Actions = require "snacks.explorer.actions"
                  return Actions.actions.explorer_move(picker, item, action)
                end

                file_utils.typescript_rename_file(picker, item)
              end,
            },
          },
        },
      },
    },
  },
}
