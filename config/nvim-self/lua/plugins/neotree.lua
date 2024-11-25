return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = { "Neotree" },
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  keys = function()
    local neotree_cfg = require "config.neotree"

    return {
      { "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "NeoTree Toggle" } },
      { "<leader>o", neotree_cfg.fucus, { desc = "NeoTree Focus" } },
    }
  end,
  opts = {
    close_if_last_window = false,
    enable_git_status = true,
    popup_border_style = "rounded",
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "quickfix" },
    sources = { "filesystem" },
    source_selector = {
      winbar = false,
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function() require("neo-tree.command").execute { action = "close" } end,
      },
    },
    window = {
      position = "right",
      width = 40,
      mappings = {
        ["<S-CR>"] = "system_open",
        ["<Space>"] = "none",
        O = "system_open",
        Y = "copy_selector",
        h = "parent_or_close",
        l = "child_or_open",
      },
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.ui.open(path)
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            if node.type == "file" then
              state.commands.open(state)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        else -- if has no children
          state.commands.open(state)
        end
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ["BASENAME"] = modify(filename, ":r"),
          ["EXTENSION"] = modify(filename, ":e"),
          ["FILENAME"] = filename,
          ["PATH (CWD)"] = modify(filepath, ":."),
          ["PATH (HOME)"] = modify(filepath, ":~"),
          ["PATH"] = filepath,
          ["URI"] = vim.uri_from_fname(filepath),
        }

        local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
        if vim.tbl_isempty(options) then
          -- notify("No values to copy", vim.log.levels.WARN)
          return
        end
        table.sort(options)
        vim.ui.select(options, {
          prompt = "Choose to copy to clipboard:",
          format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
        }, function(choice)
          local result = vals[choice]
          if result then
            -- notify(("Copied: `%s`"):format(result))
            vim.fn.setreg("+", result)
          end
        end)
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if package.loaded["neo-tree"] then
          return true
        else
          local stats = (vim.uv).fs_stat(vim.api.nvim_buf_get_name(0))
          if stats and stats.type == "directory" then
            require("lazy").load { plugins = { "neo-tree.nvim" } }
            return true
          end
        end
      end,
    })

    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit*",
      callback = function()
        local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
        if manager_avail then
          for _, source in ipairs { "filesystem" } do
            local module = "neo-tree.sources." .. source
            if package.loaded[module] then manager.refresh(require(module).name) end
          end
        end
      end,
    })
  end,
}
