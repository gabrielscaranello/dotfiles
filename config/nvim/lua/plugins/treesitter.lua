local ensure_installed = {
  "bash",
  "css",
  "diff",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "graphql",
  "html",
  "http",
  "javascript",
  "jsdoc",
  "json",
  "latex",
  "lua",
  "luap",
  "make",
  "markdown",
  "markdown_inline",
  "prisma",
  "proto",
  "query",
  "regex",
  "scss",
  "styled",
  "svelte",
  "tsx",
  "typescript",
  "typst",
  "vim",
  "vimdoc",
  "vue",
  "yaml",
}

---@type LazyPluginSpec[]
return {
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    dependencies = { "windwp/nvim-ts-autotag" },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = ensure_installed,
      highlight = { enable = true },
      indent = { enable = true },
      folds = { enable = true },
    },

    build = function()
      local TS = require "nvim-treesitter"
      if not TS.get_installed then
        vim.notify(
          "Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch.",
          vim.log.levels.ERROR
        )
        return
      end

      TS.update(nil, { summary = true })
    end,

    config = function(_, opts)
      local TS = require "nvim-treesitter"
      TS.setup(opts)
      TS.install(opts.ensure_installed):wait()

      vim.treesitter.language.register("scss", "less")
      vim.treesitter.language.register("scss", "postcss")
      vim.treesitter.language.register("bash", "kitty")
    end,
  },

  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
