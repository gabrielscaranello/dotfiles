---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",

  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        opts.autocmds.neotree_refresh = {
          {
            event = "TermClose",
            pattern = "*lazygit*",
            desc = "Refresh Neo-Tree sources when closing lazygit",
            callback = function()
              local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
              if manager_avail then
                for _, source in ipairs { "filesystem" } do
                  local module = "neo-tree.sources." .. source
                  if package.loaded[module] then manager.refresh(require(module).name) end
                end
              end
            end,
          },
        }
      end,
    },
  },
  opts = function(_, opts)
    local window = opts.window or {}
    local source_selector = opts.source_selector or {}
    local event_handlers = opts.event_handlers or {}
    local filesystem = opts.filesystem or {}
    local filtered_items = filesystem.filtered_items or {}
    local sources = { "filesystem" }

    window.width = 40
    window.position = "right"
    window.mappings = {
      ["<S-CR>"] = "system_open",
      ["<Space>"] = false,
      O = "system_open",
      Y = "copy_selector",
      h = "parent_or_close",
      l = "child_or_open",
    }

    source_selector.winbar = false

    filesystem.group_empty_dirs = true
    filtered_items.hide_dotfiles = false

    table.insert(event_handlers, {
      event = "file_opened",
      handler = function() require("neo-tree.command").execute { action = "close" } end,
    })

    opts.window = window
    opts.source_selector = source_selector
    opts.sources = sources
    opts.filesystem = filesystem
    opts.filesystem.filtered_items = filtered_items
    opts.popup_border_style = "rounded"
  end,
}
