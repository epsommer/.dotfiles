vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local api = vim.api -- for conciseness
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment number beneath cursor
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement number beneath cursor

-- window management
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
keymap.set("n", "<Leader>p", '"0p') -- Press Leader + p to paste the last yanked text
keymap.set("n", "<Leader>P", '"0P') -- Press Leader + P to paste the last yanked text before the cursor
keymap.set("v", "<Leader>p", '"0p') -- Press Leader + p to paste the last yanked text in visual mode
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
