-- ~/.config/nvim/lua/plugins/colorschemes.lua

return {
	-- Zenbones theme configuration
	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			vim.cmd("colorscheme kanagawabones")
		end,
	},
}
