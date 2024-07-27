-- ~/.config/nvim/lua/plugins/nvim-notify.lua

return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "fade_in_slide_out", -- Animation stages
      timeout = 3000, -- Duration notifications are shown
      max_width = 60, -- Maximum width of notifications
      max_height = 10, -- Maximum height of notifications
      background_color = "#282c34", -- Background color for notifications
      render = "default", -- Render style for notifications
      fps = 30, -- Frames per second for animation
    })

    -- Optional key mapping to test notifications
    vim.api.nvim_set_keymap(
      "n",
      "<leader>nt",
      [[:lua require('notify')('This is a test notification', 'info')<CR>]],
      { noremap = true, silent = true }
    )
  end,
}
