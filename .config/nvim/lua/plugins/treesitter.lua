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
			ensure_installed = {
				"vim",
				"regex",
				"bash",
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
			sync_install = false, -- Set to true if you want to install parsers synchronously
			ignore_install = {}, -- List of parsers to ignore during installation
			auto_install = true, -- Automatically install missing parsers when entering buffer
			highlight = {
				enable = true, -- Enable syntax highlighting
				additional_vim_regex_highlighting = false, -- Disable additional regex highlighting
			},
			indent = {
				enable = true,
			}, -- Enable indentation
			autotag = {
				enable = true, -- Enable autotagging with nvim-ts-autotag
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
			modules = {
				-- You can specify modules here if needed; for example:
				-- module_name = true/false,
			},
		})
	end,
}
