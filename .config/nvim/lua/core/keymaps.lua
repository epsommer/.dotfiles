-- ~/.config/nvim/lua/core/keymaps.lua
local keymap = vim.keymap.set
local api = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local cmp = require("cmp")

-- Exit Insert mode and return to Normal mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
opts.desc = "Decrement number"
api("n", "<leader>_", "<C-x>", opts)

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Move lines up and down
api("n", "<C-S-Up>", ":m .-2<CR>==", opts)
api("n", "<C-S-Down>", ":m .+1<CR>==", opts)
api("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", opts) -- Move selected lines up with Ctrl + k
api("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", opts) -- Move selected lines down with Ctrl + j

-- Modify text without altering the registers
keymap("n", "x", '"_x')
-- keymap("n", "<Leader>p", '"0p') -- Press Leader + p to paste the last yanked text
-- keymap("n", "<Leader>P", '"0P') -- Press Leader + P to paste the last yanked text before the cursor
-- keymap("v", "<Leader>p", '"0p') -- Press Leader + p to paste the last yanked text in visual mode
keymap("n", "<Leader>c", '"_c')
keymap("n", "<Leader>C", '"_C')
keymap("v", "<Leader>c", '"_c')
keymap("v", "<Leader>C", '"_C')
keymap("n", "<Leader>d", '"_d')
keymap("n", "<Leader>D", '"_D')
keymap("v", "<Leader>d", '"_d')
keymap("v", "<Leader>D", '"_D')

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap("n", "<Leader>o", "o<Esc>^Da", opts)
keymap("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap("n", "te", ":tabedit")
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
-- keymap("n", "ss", ":split<Return>", opts) -- Press ss to split the window horizontally
-- keymap("n", "sv", ":vsplit<Return>", opts) -- Press sv to split the window vertically

-- Move window
-- keymap("n", "sh", "<C-w>h") -- Press sh to move to the left split
-- keymap("n", "sk", "<C-w>k") -- Press sk to move to the upper split
-- keymap("n", "sj", "<C-w>j") -- Press sj to move to the lower split
-- keymap("n", "sl", "<C-w>l") -- Press sl to move to the right split

-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap("n", "<C-n>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Replace Hex with HSL
-- keymap.set("n", "<leader>r", function() -- Press Leader + r to replace Hex color codes with HSL color codes
--  require("craftzdog.hsl").replaceHexWithHSL()
-- end)

-- Toggle Inlay Hints
keymap("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

-- Oil.nvim shortcut
keymap("n", "-", "<cmd>lua require('oil').open()<CR>", opts)

-- Clipboard Keymaps
keymap("n", "<leader>cp", '"+y', opts)
keymap("n", "<leader>cv", '"+p', opts)

-- Yank, delete, and change to system clipboard
keymap({ "n", "v" }, "y", '"+y', opts)
keymap({ "n", "v" }, "d", '"+d', opts)
keymap({ "n", "v" }, "c", '"+c', opts)
keymap("n", "Y", '"+Y', opts)
keymap("n", "D", '"+D', opts)
keymap("n", "C", '"+C', opts)

-- Pasting from system clipboard
keymap({ "n", "v" }, "p", '"+p', opts)
keymap({ "n", "v" }, "P", '"+P', opts)
keymap({ "n", "v" }, "<leader>p", '"+p', opts)
keymap({ "n", "v" }, "<leader>P", '"+P', opts)

-- Auto-session
keymap("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })

-- Bufferline
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev tab" })

-- Formatting
keymap({ "n", "v" }, "<leader>mp", function()
	require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
end, { desc = "Format file or range (in visual mode)" })

-- Gitsigns keymaps
keymap("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Hunk" })
keymap("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev Hunk" })
keymap("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
keymap("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
keymap("v", "<leader>hs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
keymap("v", "<leader>hr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })
keymap("n", "<leader>hS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
keymap("n", "<leader>hR", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
keymap("n", "<leader>hu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
keymap("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
keymap("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })

-- LazyGit keymap(s)
keymap("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Linting keymap(s)
keymap("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- Noice keymap(s)
keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice message" })

-- nvim-cmp keymap(s)
keymap("i", "<C-n>", function()
	if cmp.visible() then
		cmp.select_next_item()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, false, true), "n", true)
	end
end, { desc = "Select next completion item" })

keymap("i", "<C-p>", function()
	if cmp.visible() then
		cmp.select_prev_item()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, false, true), "n", true)
	end
end, { desc = "Select previous completion item" })

keymap("i", "<C-y>", cmp.confirm, { desc = "Confirm completion" })

keymap("i", "<C-e>", cmp.close, { desc = "Close completion menu" })

-- nvim.notify keymap(s)
keymap(
	"n",
	"<leader>nt",
	[[:lua require('notify')('This is a test notification', 'info')<CR>]],
	{ noremap = true, silent = true, desc = "Send test notification" }
)
