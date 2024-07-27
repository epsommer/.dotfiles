-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
					-- separator_style = "slant", -- Uncomment and set to your preferred style
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							padding = 1,
							separator = true,
						},
					},
					show_buffer_close_icons = true,
					show_close_icon = true,
				},
			})
		end,
	},
}
