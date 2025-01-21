local misc = {
  branch = "",
  dots = "󰇘",
  location = "",
  modified = "●",
  module = " ",
  readonly = " ",
  unnamed = "[No Name]",
}

local dap = {
  Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}

local diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

local git = {
  added = " ",
  conflict = "",
  deleted = " ",
  ignored = "󰓳 ",
  modified = " ",
  removed = " ",
  renamed = "󰁕",
  staged = "✓",
  unstaged = "󰄱 ",
  untracked = "󰚌 ",
}

local kinds = {
  Array = " ",
  Boolean = "󰨙 ",
  Class = " ",
  Collapsed = " ",
  Color = " ",
  Constant = "󰏿 ",
  Constructor = " ",
  Control = " ",
  Copilot = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕",
  Interface = " ",
  Key = " ",
  Keyword = " ",
  Method = "󰊕 ",
  Module = misc.module,
  Namespace = "󰦮 ",
  Null = " ",
  Number = "󰎠 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  String = " ",
  Struct = "󰆼 ",
  Supermaven = " ",
  TabNine = "󰏚 ",
  Text = "󰉿 ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = "󰀫 ",
}

return {
  dap = dap,
  diagnostics = diagnostics,
  git = git,
  kinds = kinds,
  misc = misc,
}
