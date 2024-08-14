-- ~/.config/nvim/lua/plugins/lsp/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"antosha417/nvim-lsp-file-operations",
			"folke/neodev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Set up key mappings for LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local bufopts = { buffer = ev.buf, silent = true }

					local keymap = vim.keymap -- For conciseness

					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", bufopts)
					keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", bufopts)
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", bufopts)
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", bufopts)
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", bufopts)
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts)
					keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
					keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
					keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					keymap.set("n", "<leader>rs", ":LspRestart<CR>", bufopts)
				end,
			})

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Define diagnostic signs
			local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
			for type, icon in pairs(signs) do
				vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
			end

			-- Set up LSP servers
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT", -- or Lua 5.1/5.2/5.3/5.4
									path = vim.split(package.path, ";"),
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
				["svelte"] = function()
					lspconfig.svelte.setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				end,
				-- Add more specific configurations for other LSP servers here
			})
		end,
	},
}
