local icons = require "utils.icons"
local lsp_utils = require "utils.lsp"
local spell_utils = require "utils.spell"

return {
  ---@param colors CtpColors<string>
  ai = function(colors)
    local provider = vim.g.ai.provider
    local function ai_status()
      if provider == nil then
        return nil
      end
      return icons.kinds[provider:sub(1, 1):upper() .. provider:sub(2)]
    end

    local get_color = function()
      if vim.fn.exists ":Codeium" > 0 then
        return { fg = colors.teal }
      elseif lsp_utils.clients.copilot_lsp_active() then
        return { fg = colors.sapphire }
      else
        return { fg = colors.text }
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
  ---@param colors CtpColors<string>
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
      color = { bg = colors.surface1, fg = colors.text },
      separator = { left = "" },
      cond = function()
        return #lsp_utils.clients.get_all() > 0
      end,
    }
  end,
  ---@param colors CtpColors<string>
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
      color = { bg = colors.surface2, fg = colors.text },
      separator = { left = "" },
      cond = function()
        return spell_utils.is_spell_enabled()
      end,
    }
  end,
}
