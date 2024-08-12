-- ~/.config/nvim/lua/plugins/todo-comments.lua
return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		-- Set keymaps
		local keymap = vim.keymap -- For conciseness
		local api = vim.api -- For conciseness

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		api.nvim_set_keymap("n", "<leader>tt", ":TodoTelescope<CR>", { noremap = true, silent = true })

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		api.nvim_set_keymap("n", "<leader>tt", ":TodoTelescope<CR>", { noremap = true, silent = true })

		todo_comments.setup({
			keywords = {
				TODO = { icon = " ", color = "info", alt = { "TODO" } },
				HACK = { icon = " ", color = "warning", alt = { "HACK" } },
				WARN = { icon = " ", color = "#E9D502", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", color = "#33C58E", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "NOTE", "INFO", "HINT" } },
				FIX = { icon = " ", color = "error", alt = { "FIXME", "FIXIT", "FIXIT", "ERROR" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },

				-- Keywords
				-- TODO:  This is an example of a TODO comment
				-- HACK:  This is an example of a HACK comment
				-- WARN:  This is an example of a WARNING comment
				-- PERF:  This is an example of a PERF comment
				-- NOTE:  This is an example of a NOTE comment
				-- FIX:   This is an example of a FIX comment
				-- TEST:  This is an example of a TEST comment
			},
		})
	end,
}
