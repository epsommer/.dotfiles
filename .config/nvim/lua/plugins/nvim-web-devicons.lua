-- ~/.config/nvim/lua/plugins/devicons.lua
return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			-- Customize folder icons here
			default = false, -- Ensure default icons are used if you don't specify any custom ones
		})
	end,
}
