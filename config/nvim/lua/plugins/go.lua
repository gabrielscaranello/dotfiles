---@type LazySpec
return {
  { "ray-x/go.nvim", build = ':lua require("go.install").update_all()' },
}
