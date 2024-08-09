-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
	-- Zenbones theme configuration
	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			local colors = require("core.colors")

			-- Set the color scheme
			vim.cmd("colorscheme kanagawabones")

			-- Override the background color
			vim.cmd("highlight Normal guibg=" .. colors.bg)

			-- Ensure the background color is applied consistently
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.cmd("highlight Normal guibg=" .. colors.bg)
				end,
			})
		end,
	},
}
