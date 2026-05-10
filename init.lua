vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins") -- do this one first, mainly due to colorscheme
require("options")
require("keymaps")
require("autocommands")
