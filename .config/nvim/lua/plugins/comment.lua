return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment with required fields
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
			post_hook = function(_) end, -- Function to run after commenting (set to nil if not needed)
			padding = true, -- Add a space b/w comment and the line
			sticky = true, -- Keep the cursor at its position
			ignore = "^$", -- Ignore empty lines when commenting
			mappings = {
				basic = true, -- Basic mappings: `gcc`, `gbc`, etc.
				extra = true, -- Extra mappings: `gco`, `gcO`, `gcA`
				extended = false, -- Extended mappings: `g>`, `g<`, `g>[count]`, `g<[count]`
			},
			toggler = {
				line = "gcc", -- Line-comment toggle keymap
				block = "gbc", -- Block-comment toggle keymap
			},
			opleader = {
				line = "gc", -- Line-comment keymap
				block = "gb", -- Block-comment keymap
			},
			extra = {
				above = "gcO", -- Comment above
				below = "gco", -- Comment below
				eol = "gcA", -- Comment end of line
			},
		})
	end,
}
