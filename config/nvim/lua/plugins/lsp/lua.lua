local lazydev_load = {
  "catppuccin",
  "snacks.nvim",
}

return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = (function()
        local lazy_path = vim.fn.stdpath "data" .. "/lazy"
        local libs = {}

        for _, plugin in ipairs(lazydev_load) do
          local plugin_path = lazy_path .. "/" .. plugin
          if vim.fn.isdirectory(plugin_path) == 1 then
            table.insert(libs, plugin_path)
          end
        end

        table.insert(libs, { path = "${3rd}/luv/library", words = { "vim%.uv" } })

        return libs
      end)(),
    },
  },
}
