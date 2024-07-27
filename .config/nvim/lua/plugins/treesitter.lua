-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- Import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- Configure treesitter
		treesitter.setup({
			highlight = {
				enable = true, -- Enable syntax highlighting
				additional_vim_regex_highlighting = false, -- Disable additional regex highlighting
			},
			indent = { enable = true }, -- Enable indentation
			autotag = {
				enable = true, -- Enable autotagging with nvim-ts-autotag
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		-- Configure vim.lsp.util to be handled by Noice
		local noice = require("noice")
		if noice.lsp then
			vim.lsp.util.convert_input_to_markdown_lines = noice.lsp.convert_input_to_markdown_lines
			vim.lsp.util.stylize_markdown = noice.lsp.stylize_markdown
		else
			print("Noice LSP integration is not available")
		end
	end,
}
