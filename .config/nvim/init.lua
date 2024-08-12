-- ~/.config/nvim/init.lua

-- Set mapleader early
vim.g.mapleader = " "

-- Load core settings
require("core.options")

-- Load plugins through lazy.nvim
require("core.lazy")

-- Load keymaps after plugins
require("core.keymaps")
