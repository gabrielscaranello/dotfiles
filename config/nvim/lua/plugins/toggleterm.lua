return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },

  keys = function()
    local cfg = require "config.toggleterm"
    local has_btop = vim.fn.executable "btop" == 1
    local has_gdu = vim.fn.executable "gdu" == 1
    local has_lazydocker = vim.fn.executable "docker" == 1 and vim.fn.executable "lazydocker" == 1
    local has_lazygit = vim.fn.executable "git" == 1 and vim.fn.executable "lazygit" == 1
    local has_node = vim.fn.executable "node" == 1
    local has_python = vim.fn.executable "python" == 1

    local keys = {
      { "<C-'>", "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "t" } },
      { "<C-'>", "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "i" } },
      { "<C-'>", '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle Terminal" },
      { "<F7>", "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "t" } },
      { "<F7>", "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "i" } },
      { "<F7>", '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle Terminal" },
      { "<leader>tt", '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle Terminal" },
      { "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm Float" },
      { "<leader>th", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", desc = "ToggleTerm Horizontal Split" },
      { "<leader>tv", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", desc = "ToggleTerm Vertical Split" },
    }

    if has_btop then
      keys[#keys + 1] =
        { "<leader>tb", function() cfg.toggle_cmd { cmd = "btop", direction = "float" } end, desc = "ToggleTerm btop" }
    end

    if has_gdu then
      keys[#keys + 1] =
        { "<leader>tu", function() cfg.toggle_cmd { cmd = "gdu", direction = "float" } end, desc = "ToggleTerm GDU" }
    end

    if has_lazydocker then
      keys[#keys + 1] = {
        "<leader>td",
        function() cfg.toggle_cmd { cmd = "lazydocker", direction = "float" } end,
        desc = "ToggleTerm Lazydocker",
      }
    end

    if has_lazygit then
      local lazygit = {
        callback = function()
          local worktree = cfg.file_worktree()
          local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
          cfg.toggle_cmd { cmd = "lazygit " .. flags, direction = "float" }
        end,
        desc = "ToggleTerm Lazygit",
      }

      keys[#keys + 1] = { "<leader>gg", lazygit.callback, desc = lazygit.desc }
      keys[#keys + 1] = { "<leader>tl", lazygit.callback, desc = lazygit.desc }
    end

    if has_node then
      keys[#keys + 1] = { "<leader>tn", function() cfg.toggle_cmd { cmd = "node" } end, desc = "ToggleTerm Node" }
    end

    if has_python then
      keys[#keys + 1] = { "<leader>tp", function() cfg.toggle_cmd { cmd = "python" } end, desc = "ToggleTerm Python" }
    end

    return keys
  end,

  opts = {
    highlights = {
      Normal = { link = "Normal" },
      NormalNC = { link = "NormalNC" },
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
      StatusLine = { link = "StatusLine" },
      StatusLineNC = { link = "StatusLineNC" },
      WinBar = { link = "WinBar" },
      WinBarNC = { link = "WinBarNC" },
    },
    size = 10,
    on_create = function(t)
      vim.opt_local.foldcolumn = "0"
      vim.opt_local.signcolumn = "no"
      if t.hidden then
        local keymap = require "utils.keymap"
        local function toggle() t:toggle() end
        keymap.map {
          { { "n", "t", "i" }, "<C-'>", toggle, { desc = "Toggle Terminal", buffer = t.bufnr } },
          { { "n", "t", "i" }, "<F7>", toggle, { desc = "Toggle Terminal", buffer = t.bufnr } },
        }
      end
    end,
    shading_factor = 2,
    float_opts = { border = "rounded" },
  },
}
