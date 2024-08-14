-- ~/.config/nvim/lua/plugins/noice.lua
local colors = require("core.colors") -- Import colors from colors.lua

return {
	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			local noice = require("noice")

			-- Setup Noice with custom configuration
			noice.setup({
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
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
				},
			})

			-- Apply custom highlights
			local function apply_custom_highlights()
				vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = colors.pink, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceMessage", { fg = colors.pink, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoicePopupMenu", { fg = colors.bone, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.nickel, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.bone, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceCursor", { fg = colors.nickel, bg = colors.bg })
				vim.api.nvim_set_hl(0, "NoiceCmdLineIconCmdLine", { fg = colors.nickel, bg = colors.bg })
			end

			apply_custom_highlights()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = apply_custom_highlights,
			})

			-- Integrate nvim-cmp
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.scroll_docs(4)
						else
							fallback()
						end
					end, { "i", "c" }),
					["<C-b>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.scroll_docs(-4)
						else
							fallback()
						end
					end, { "i", "c" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = function(entry, item)
						item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return item
					end,
					fields = { "kind", "abbr", "menu" },
					expandable_indicator = true,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered({
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						zindex = 50,
						max_width = math.floor(vim.o.columns * 0.4),
						max_height = math.floor(vim.o.lines * 0.4),
					}),
				},
				experimental = {
					ghost_text = true,
				},
				event = {
					on_entry_complete = function()
						require("noice").completion()
					end,
				},
			})
		end,
	},
}
