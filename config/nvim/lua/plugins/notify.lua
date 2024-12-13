return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#000000",
    level = "info",
    max_width = 50,
    mininum_width = 40,
    render = "minimal",
    stages = "fade_in_slide_out",
    timeout = 1000,
    top_down = false,
  },
  init = function()
    vim.notify = function(msg, level, opts)
      if msg:match "saved" then
        opts = opts or {}
        opts.timeout = 500
        opts.render = "minimal"
      end
      require "notify"(msg, level, opts)
    end
  end,
}
