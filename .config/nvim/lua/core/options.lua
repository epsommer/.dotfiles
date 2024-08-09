-- ~/.config/nvim/lua/options.lua
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
local clipboard_tool = os.getenv("WAYLAND_DISPLAY") and "wl-copy" or "xclip"

opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- Search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.fillchars = {
	eob = " ", -- Replace end-of-buffer tilde with a space
}

-- Turn on termguicolors for tokyonight colorscheme to work
-- Must use iterm2 or any other true color terminal
opt.termguicolors = true
opt.background = "dark" -- Colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard Configurations
vim.g.clipboard = {
	name = "custom_clipboard",
	copy = {
		["+"] = clipboard_tool,
		["*"] = clipboard_tool,
	},
	paste = {
		["+"] = clipboard_tool:gsub("copy", "paste"),
		["*"] = clipboard_tool:gsub("copy", "paste"),
	},
	cache_enabled = 1,
}

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Turn off swapfile
opt.swapfile = false

-- Configure Neovim to use the virtual enviroment's Python
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim_env/bin/python")

-- Perl Configuration
vim.g.loaded_perl_provider = 1

-- Auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

print("LUA_PATH: " .. (os.getenv("LUA_PATH") or "Not set"))
print("LUA_CPATH: " .. (os.getenv("LUA_CPATH") or "Not set"))

local status, magick = pcall(require, "magick")
if status then
	print("magick module loaded successfully")
else
	print("Failed to load magick module: " .. magick)
end
