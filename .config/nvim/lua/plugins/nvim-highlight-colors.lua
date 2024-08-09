return {
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "foreground", -- or 'foreground' for text color
				enable_named_colors = true,
				enable_tailwind = true,
			})
		end,
	},
}
