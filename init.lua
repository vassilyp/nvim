vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins") -- require plugins first to allow plugin-related customization
require("options")
require("autocommands")
require("lsp")
require("keymaps")
