-- ~/.config/nvim/lua/plugins/mini_indentscope.lua
return {
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		opts = {
			symbol = "│", -- Customize the symbol or style
			options = {
				-- Enable animation of indentation guides
				draw = {
					animation = {
						enabled = true,
						interval = 50, -- Adjust the speed of the animation
					},
				},
			},
		},
	},
}
