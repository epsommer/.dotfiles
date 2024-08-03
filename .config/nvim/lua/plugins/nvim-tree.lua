-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")
		local colors = require("core.colors") -- Import colors from colors.lua

		-- Recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			on_attach = "default",
			hijack_cursor = true,
			auto_reload_on_write = true,
			disable_netrw = false,
			hijack_netrw = true,
			root_dirs = {},
			prefer_startup_root = false,
			sync_root_with_cwd = false,
			reload_on_bufenter = false,
			respect_buf_cwd = false,
			select_prompts = false,
			sort = {
				sorter = "name",
				folders_first = true,
				files_first = false,
			},
			diagnostics = {
				enable = true,
			},
			view = {
				centralize_selection = false,
				cursorline = true,
				debounce_delay = 15,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false, -- Disable line numbers
				signcolumn = "yes",
				width = 35,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- Remove arrow
							arrow_open = "", -- Remove arrow
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- Set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		-- UI customizations: set highlight overrides
		local function apply_custom_highlights()
			local hl_override = {
				-- File icons
				DevIconc = { fg = colors.nickel },
				DevIconcss = { fg = colors.nickel },
				DevIcondeb = { fg = colors.nickel },
				DevIcondockerfile = { fg = colors.nickel },
				DevIconhtml = { fg = colors.nickel },
				DevIconjpeg = { fg = colors.nickel },
				DevIconjpg = { fg = colors.nickel },
				DevIconjs = { fg = colors.nickel },
				DevIconkt = { fg = colors.nickel },
				DevIconlock = { fg = colors.nickel },
				DevIconlua = { fg = colors.nickel },
				DevIconmp3 = { fg = colors.nickel },
				DevIconmp4 = { fg = colors.nickel },
				DevIconout = { fg = colors.nickel },
				DevIconpng = { fg = colors.nickel },
				DevIconpy = { fg = colors.nickel },
				DevIcontoml = { fg = colors.nickel },
				DevIconts = { fg = colors.nickel },
				DevIconttf = { fg = colors.nickel },
				DevIconrb = { fg = colors.nickel },
				DevIconrpm = { fg = colors.nickel },
				DevIconvue = { fg = colors.nickel },
				DevIconwoff = { fg = colors.nickel },
				DevIconwoff2 = { fg = colors.nickel },
				DevIconxz = { fg = colors.nickel },
				DevIconzip = { fg = colors.nickel },
				DevIconzig = { fg = colors.nickel }, -- fixed typo from `nickle` to `nickel`
				DevIconmd = { fg = colors.nickel },
				DevIcontsx = { fg = colors.nickel },
				DevIconjsx = { fg = colors.nickel },
				DevIconsvelte = { fg = colors.nickel },
				DevIconjava = { fg = colors.nickel },
				DevIcondart = { fg = colors.nickel },

				-- Folder highlights
				NvimTreeFolderIcon = { fg = colors.crayola_gold },
				NvimTreeFolderName = { fg = colors.bone },
				NvimTreeOpenedFolderName = { fg = colors.bone },
				NvimTreeEmptyFolderName = { fg = colors.nickel },
				NvimTreeSymlinkFolderName = { fg = colors.nickel },
				NvimTreeRootFolder = { fg = colors.nickel },

				-- Cursor related highlights
				Cursor = { fg = colors.inactive_bg, bg = colors.nickel },
				CursorLineNr = { fg = colors.bone, bg = colors.inactive_bg },
				NvimTreeCursorLineNr = { fg = colors.bone, bg = colors.inactive_bg },
				NvimTreeStatusLine = { fg = colors.bone, bg = colors.inactive_bg },
			}

			for icon, color in pairs(hl_override) do
				vim.cmd(string.format("highlight %s guifg=%s guibg=%s", icon, color.fg or "NONE", color.bg or "NONE"))
			end
		end

		-- Call the highlight function immediately and on certain events
		apply_custom_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = apply_custom_highlights,
		})
	end,
}
