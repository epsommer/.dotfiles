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
			background_colour = "#282c34", -- Background colour for notifications (deprecated)
			render = "default", -- Render style for notifications
			fps = 30, -- Frames per second for animation
			icons = { -- Icons for different notification types
				INFO = "",
				WARN = "",
				ERROR = "",
				DEBUG = "",
				TRACE = "✎",
			},
			time_formats = { -- Time formats for the notifications
				seconds = "s",
				minutes = "m",
				hours = "h",
				days = "d",
				weeks = "w",
			},
			on_open = function(win) -- Callback for when a notification opens
				print("Notification opened")
			end,
			on_close = function() -- Callback for when a notification closes
				print("Notification closed")
			end,
			minimum_width = 50, -- Minimum width of notifications
			top_down = true, -- Whether to stack notifications top-down
		})
	end,
}
