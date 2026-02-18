local icons = require "utils.icons"
local lsp_utils = require "utils.lsp"
local spell_utils = require "utils.spell"
local ai = require "utils.ai"

return {
  ---@param colors ColorScheme
  ai = function(colors)
    local provider = ai.get_provider()
    local function ai_status()
      if provider == nil then
        return nil
      end
      return icons.kinds[provider:sub(1, 1):upper() .. provider:sub(2)]
    end

    local get_color = function()
      if ai.codeium_is_attached() then
        return { fg = colors.green1 }
      elseif ai.copilot_is_attached() then
        return { fg = colors.blue2 }
      else
        return { fg = colors.fg }
      end
    end

    return {
      ai_status,
      color = get_color,
      padding = { left = 0, right = 1 },
      cond = function()
        return provider ~= nil
      end,
    }
  end,
  ---@param colors ColorScheme
  lsp = function(colors)
    local function lsp_status()
      local clients = lsp_utils.clients.get_all()
      if #clients == 0 then
        return nil
      end

      local lsp_names = {}
      for _, client in ipairs(clients) do
        if not vim.tbl_contains(lsp_names, client.name) then
          table.insert(lsp_names, client.name)
        end
      end

      table.sort(lsp_names, function(a, b)
        return a < b
      end)

      return table.concat(lsp_names, " | ")
    end

    return {
      lsp_status,
      color = { bg = colors.dark3, fg = colors.fg },
      separator = { left = "" },
      cond = function()
        return #lsp_utils.clients.get_all() > 0
      end,
    }
  end,
  ---@param colors ColorScheme
  spell = function(colors)
    local spelllangs = function()
      local langs = vim.o.spelllang:lower():gsub("pt_br", "br")
      local langs_tbl = vim.split(langs, ",")

      table.sort(langs_tbl)
      langs = table.concat(langs_tbl, "|")

      return "󰓆 [" .. langs .. "]"
    end

    return {
      spelllangs,
      color = { bg = colors.dark3, fg = colors.fg },
      separator = { left = "" },
      cond = function()
        return spell_utils.is_spell_enabled()
      end,
    }
  end,
}
