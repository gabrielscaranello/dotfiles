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
  "jsx",
  "latex",
  "lua",
  "luadoc",
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
    lazy = false,
    commit = "7caec274fd19c12b55902a5b795100d21531391f",
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

      TS.update(nil, { summary = false })
    end,

    config = function(_, opts)
      local TS = require "nvim-treesitter"
      TS.setup(opts)
      TS.install(opts.ensure_installed, { summary = false, max_jobs = 4 })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end

          vim.treesitter.start(buf, language)
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.treesitter.language.register("scss", "less")
      vim.treesitter.language.register("scss", "postcss")
      vim.treesitter.language.register("bash", "kitty")
      vim.treesitter.language.register("bash", "dotenv")
      vim.treesitter.language.register("yaml", "yaml.docker-compose")
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
