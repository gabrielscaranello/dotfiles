---@type LazySpec
return {
  "AstroNvim/astroui",
  tag = "stable",
  pin = true,

  dependencies = { "catppuccin" },

  ---@type AstroUIOpts
  opts = {
    colorscheme = "catppuccin",

    status = {
      separators = {
        left = { "", " " }, -- separator for the left side of the statusline
        right = { " ", "" }, -- separator for the right side of the statusline
        tab = { "|", "" },
      },

      attributes = {
        mode = { bold = true },
      },
    },

    icons = {
      ActiveLSP = "",
      ActiveTS = " ",
      BufferClose = "",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = "",
      DapStopped = "",
      DefaultFile = "",
      Diagnostic = "",
      DiagnosticError = "",
      DiagnosticHint = "",
      DiagnosticInfo = "",
      DiagnosticWarn = "",
      Ellipsis = "",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      Git = "",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "",
      GitRenamed = "",
      GitStaged = "",
      GitUnstaged = "",
      GitUntracked = "",
      LSPLoaded = "",
      LSPLoading1 = "",
      LSPLoading2 = "",
      LSPLoading3 = "",
      MacroRecording = "",
      Paste = "",
      Search = "",
      Selected = "",
      TabClose = "",
    },
  },
}
