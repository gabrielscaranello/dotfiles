local char = "▏"

local exclude = {
  buftypes = {
    "nofile",
    "prompt",
    "quickfix",
    "terminal",
  },
  filetypes = {
    "alpha",
    "help",
    "lazy",
    "mason",
    "neo-tree",
  },
}

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "IBLEnable", "IBLDisable", "IBLToggle", "IBLEnableScope", "IBLDisableScope", "IBLToggleScope" },
    opts = {
      indent = { char = char },
      scope = { show_start = false, show_end = false, enabled = false },
      exclude = exclude,
    },
  },

  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return {
        options = { try_as_border = true },
        symbol = char,
      }
    end,

    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(event)
          if vim.b[event.buf].miniindentscope_disable == nil then
            local filetype = vim.bo[event.buf].filetype
            if vim.tbl_contains(exclude.filetypes, filetype) then vim.b[event.buf].miniindentscope_disable = true end
          end
        end,
      })

      vim.api.nvim_create_autocmd("BufWinEnter", {
        callback = function(event)
          if vim.b[event.buf].miniindentscope_disable == nil then
            local buftype = vim.bo[event.buf].buftype
            if vim.tbl_contains(exclude.buftypes, buftype) then vim.b[event.buf].miniindentscope_disable = true end
          end
        end,
      })

      vim.api.nvim_create_autocmd("TermOpen", {
        callback = function(event)
          if vim.b[event.buf].miniindentscope_disable == nil then vim.b[event.buf].miniindentscope_disable = true end
        end,
      })
    end,
  },
}
