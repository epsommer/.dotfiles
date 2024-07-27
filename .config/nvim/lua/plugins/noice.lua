-- ~/.config/nvim/lua/plugins/noice.lua
local colors = require("core.colors") -- Import colors from colors.lua

return {
	{
		"folke/noice.nvim",
		config = function()
			-- Setup Noice with custom configuration
			require("noice").setup({
				views = {
					cmdline_popup = {
						border = {
							style = "rounded", -- or "single", "double", "none"
							padding = { 0, 1 },
						},
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:FloatBorder,NoiceBorder:NoiceBorder",
						},
					},
				},
				-- Add any other plugin options here
			})

			-- Apply custom highlights
			local function apply_custom_highlights()
				vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = colors.pink, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceMessage", { fg = colors.pink, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoicePopupMenu", { fg = colors.white, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.nickel, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.white, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceCursor", { fg = colors.nickel, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceCmdLineIconCmdLine", { fg = colors.nickel, bg = colors.bg })
			end

			-- Call the highlight function immediately and on certain events
			apply_custom_highlights()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = apply_custom_highlights,
			})
		end,
	},
}
