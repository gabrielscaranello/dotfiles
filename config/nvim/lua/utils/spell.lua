local M = {}

local function disable_spell()
  vim.o.spell = false
  vim.notify "Spellcheck disabled"
end

---@param silent? boolean
local function enable_spell(silent)
  vim.o.spell = true
  if not silent then
    vim.notify "Spellcheck enabled"
  end
end

---@return boolean
function M.is_spell_enabled()
  return vim.o.spell
end

---@param lang string
function M.set_spelllang(lang)
  if not lang or lang == "" then
    vim.notify("No spellcheck language specified", vim.log.levels.ERROR)
  end

  if not M.is_spell_enabled() then
    enable_spell(true)
  end

  local langs = vim.split(lang, ",")
  vim.opt.spelllang = langs
  vim.notify(("Spellcheck language set to %s"):format(lang))
end

function M.toggle_spell()
  if M.is_spell_enabled() then
    disable_spell()
  else
    enable_spell()
  end
end

return M
