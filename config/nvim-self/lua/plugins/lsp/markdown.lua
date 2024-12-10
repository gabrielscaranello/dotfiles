return {
  "iamcco/markdown-preview.nvim",
  build = function(plugin)
    local package_manager = vim.fn.executable "yarn" and "yarn" or vim.fn.executable "npx" and "npx -y yarn" or false

    --- HACK: Use `yarn` or `npx` when possible, otherwise throw an error
    ---@see https://github.com/iamcco/markdown-preview.nvim/issues/690
    ---@see https://github.com/iamcco/markdown-preview.nvim/issues/695
    if not package_manager then error "Missing `yarn` or `npx` in the PATH" end

    local cmd = string.format(
      "!cd %s && cd app && COREPACK_ENABLE_AUTO_PIN=0 %s install --frozen-lockfile",
      plugin.dir,
      package_manager
    )

    vim.cmd(cmd)
  end,
  ft = { "markdown", "markdown.mdx" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  init = function()
    local plugin = require("lazy.core.config").spec.plugins["markdown-preview.nvim"]
    vim.g.mkdp_filetypes = require("lazy.core.plugin").values(plugin, "ft", true)
  end,
}
