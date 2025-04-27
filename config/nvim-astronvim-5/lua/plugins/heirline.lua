---@type LazySpec
return {
  "rebelot/heirline.nvim",
  optional = true,
  opts = function(_, opts)
    local status = require "astroui.status"

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode(),
      status.component.git_branch(),
      status.component.file_info {
        file_icon = { padding = { left = 0 } },
        filename = { fallback = "Empty" },
        padding = { right = 0 },
        filetype = false,
        surround = { separator = "left", condition = false },
      },
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.treesitter(),
      status.component.nav(),
    }

    opts.winbar = nil
  end,
}
