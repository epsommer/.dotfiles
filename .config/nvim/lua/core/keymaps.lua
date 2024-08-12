-- ~/.config/nvim/lua/core/keymaps.lua
vim.g.mapleader = " "

local keymap = vim.keymap -- For conciseness
local api = vim.api -- For conciseness
local opts = { noremap = true, silent = true } -- For conciseness
local cmp = require("cmp")

-- Exit Insert mode and return to Normal mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment number beneath cursor
vim.api.nvim_set_keymap("n", "<leader>_", "<C-x>", { noremap = true, silent = true, desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Key mappings for moving lines up and down
api.nvim_set_keymap("n", "<C-S-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-S-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Move selected lines up with Ctrl + k
api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Move selected lines down with Ctrl + j

-- Do things without affecting the registers
keymap.set("n", "x", '"_x') -- Press 'x' to delete a character without copying it
-- keymap.set("n", "<Leader>p", '"0p') -- Press Leader + p to paste the last yanked text
-- keymap.set("n", "<Leader>P", '"0P') -- Press Leader + P to paste the last yanked text before the cursor
-- keymap.set("v", "<Leader>p", '"0p') -- Press Leader + p to paste the last yanked text in visual mode
keymap.set("n", "<Leader>c", '"_c') -- Press Leader + c to change text without copying it
keymap.set("n", "<Leader>C", '"_C') -- Press Leader + C to change text to the end of the line without copying it
keymap.set("v", "<Leader>c", '"_c') -- Press Leader + c to change text in visual mode without copying it
keymap.set("v", "<Leader>C", '"_C') -- Press Leader + C to change text to the end of the line in visual mode without copying it
keymap.set("n", "<Leader>d", '"_d') -- Press Leader + d to delete text without copying it
keymap.set("n", "<Leader>D", '"_D') -- Press Leader + D to delete text to the end of the line without copying it
keymap.set("v", "<Leader>d", '"_d') -- Press Leader + d to delete text in visual mode without copying it
keymap.set("v", "<Leader>D", '"_D') -- Press Leader + D to delete text to the end of the line in visual mode without copying it

-- Increment/decrement
keymap.set("n", "+", "<C-a>") -- Press + to increment the number under the cursor
keymap.set("n", "-", "<C-x>") -- Press - to decrement the number under the cursor

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d') -- Press dw to delete the word before the cursor

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G") -- Press Ctrl + a to select all text

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts) -- Press Leader + o to insert a new line below and start editing
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts) -- Press Leader + O to insert a new line above and start editing

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts) -- Press Ctrl + m to go forward in the jump list

-- New tab
keymap.set("n", "te", ":tabedit") -- Press te to open a new tab
keymap.set("n", "<tab>", ":tabnext<Return>", opts) -- Press Tab to go to the next tab
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts) -- Press Shift + Tab to go to the previous tab

-- Split window
-- keymap.set("n", "ss", ":split<Return>", opts) -- Press ss to split the window horizontally
-- keymap.set("n", "sv", ":vsplit<Return>", opts) -- Press sv to split the window vertically

-- Move window
-- keymap.set("n", "sh", "<C-w>h") -- Press sh to move to the left split
-- keymap.set("n", "sk", "<C-w>k") -- Press sk to move to the upper split
-- keymap.set("n", "sj", "<C-w>j") -- Press sj to move to the lower split
-- keymap.set("n", "sl", "<C-w>l") -- Press sl to move to the right split

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><") -- Press Ctrl + w + left arrow to decrease window width
keymap.set("n", "<C-w><right>", "<C-w>>") -- Press Ctrl + w + right arrow to increase window width
keymap.set("n", "<C-w><up>", "<C-w>+") -- Press Ctrl + w + up arrow to increase window height
keymap.set("n", "<C-w><down>", "<C-w>-") -- Press Ctrl + w + down arrow to decrease window height

-- Diagnostics
keymap.set("n", "<C-j>", function() -- Press Ctrl + j to jump to the next diagnostic message
	vim.diagnostic.goto_next()
end, opts)

-- Replace Hex with HSL
-- keymap.set("n", "<leader>r", function() -- Press Leader + r to replace Hex color codes with HSL color codes
--  require("craftzdog.hsl").replaceHexWithHSL()
-- end)

-- Toggle Inlay Hints
keymap.set("n", "<leader>i", function() -- Press Leader + i to toggle inlay hints on or off
	require("craftzdog.lsp").toggleInlayHints()
end)

-- Oil.nvim shortcut here
vim.keymap.set("n", "-", "<cmd>lua require('oil').open()<CR>", { noremap = true, silent = true })

-- Clipboard Keymaps
keymap.set("n", "<leader>cp", '"+y', opts)
keymap.set("n", "<leader>cv", '"+p', opts)

-- Yank to system clipboard
keymap.set("n", "y", '"+y', opts)
keymap.set("v", "y", '"+y', opts)
keymap.set("n", "Y", '"+Y', opts)

-- Delete to system clipboard
keymap.set("n", "d", '"+d', opts)
keymap.set("v", "d", '"+d', opts)
keymap.set("n", "D", '"+D', opts)

-- Change to system clipboard
keymap.set("n", "c", '"+c', opts)
keymap.set("v", "c", '"+c', opts)
keymap.set("n", "C", '"+C', opts)

-- Ensure to always use the system clipboard for pasting
keymap.set("n", "p", '"+p', opts)
keymap.set("n", "P", '"+P', opts)
keymap.set("v", "p", '"_dP', opts)
keymap.set("v", "P", '"_dP', opts)

-- Additional mappings to handle newline issue
keymap.set("n", "<leader>p", '"+p', opts)
keymap.set("n", "<leader>P", '"+P', opts)
keymap.set("v", "<leader>p", '"+p', opts)
keymap.set("v", "<leader>P", '"+P', opts)

-- Clear search highlight
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Auto-session
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- Bufferline
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev tab" })

-- Formatting
keymap.set({ "n", "v" }, "<leader>mp", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- Gitsigns keymaps
keymap.set("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Hunk" })
keymap.set("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev Hunk" })
keymap.set("n", "<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
keymap.set("n", "<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
keymap.set("v", "<leader>hs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
keymap.set("v", "<leader>hr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })
keymap.set("n", "<leader>hS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
keymap.set("n", "<leader>hR", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
keymap.set("n", "<leader>hu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
keymap.set("n", "<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
keymap.set("n", "<leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
keymap.set("n", "<leader>hB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame" })
keymap.set("n", "<leader>hd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })
keymap.set("n", "<leader>hD", function()
	require("gitsigns").diffthis("~")
end, { desc = "Diff this ~" })
keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })

-- LazyGit keymap(s)
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })

-- Linting
vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- Noice keymaps
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" }) -- dismiss Noice message

-- nvim-cmp keymaps
keymap.set("i", "<C-n>", function()
	if cmp.visible() then
		cmp.select_next_item()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, false, true), "n", true)
	end
end, { desc = "Select next completion item" })

keymap.set("i", "<C-p>", function()
	if cmp.visible() then
		cmp.select_prev_item()
	else
		api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, false, true), "n", true)
	end
end, { desc = "Select previous completion item" })

keymap.set("i", "<C-y>", cmp.confirm, { desc = "Confirm completion" })

keymap.set("i", "<C-e>", cmp.close, { desc = "Close completion menu" })

-- nvim.notify keymaps
api.nvim_set_keymap(
	"n",
	"<leader>nt",
	[[:lua require('notify')('This is a test notification', 'info')<CR>]],
	{ noremap = true, silent = true }
)
