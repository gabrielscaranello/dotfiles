return {
  lsp = function(colors)
    local function lsp_status()
      local clients = vim.lsp.get_active_clients()
      if #clients == 0 then return nil end

      local lsp_names = {}
      for _, client in ipairs(clients) do
        table.insert(lsp_names, client.name)
      end

      return table.concat(lsp_names, " | ")
    end

    return {
      lsp_status,
      color = { bg = colors.surface1, fg = colors.text },
      separator = { left = "" },
      cond = function() return #vim.lsp.get_active_clients() > 0 end,
    }
  end,
}
