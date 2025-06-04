local icons = require "utils.icons"
return {
  ai = function(colors)
    local provider = vim.g.ai.provider
    local function ai_status() return icons.kinds[provider:sub(1, 1):upper() .. provider:sub(2)] end

    local get_color = function()
      if vim.fn.exists ":Codeium" > 0 then
        return { fg = colors.teal }
      elseif #(vim.lsp.get_clients { name = "copilot" }) > 0 then
        return { fg = colors.sapphire }
      else
        return { fg = colors.text }
      end
    end

    return {
      ai_status,
      color = get_color,
      padding = { left = 0, right = 1 },
      cond = function() return provider ~= nil end,
    }
  end,
  lsp = function(colors)
    local function lsp_status()
      local all_clients = vim.lsp.get_clients()
      local clients = vim.tbl_filter(function(client) return client.name ~= "copilot" end, all_clients)

      if #clients == 0 then return nil end

      local lsp_names = {}
      for _, client in ipairs(clients) do
        table.insert(lsp_names, client.name)
      end

      table.sort(lsp_names, function(a, b) return a < b end)
      return table.concat(lsp_names, " | ")
    end

    return {
      lsp_status,
      color = { bg = colors.surface1, fg = colors.text },
      separator = { left = "" },
      cond = function() return #vim.lsp.get_clients() > 0 end,
    }
  end,
}
