-- This is for global configuration changes

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- I have a Nerd font
vim.g.have_nerd_font = true

-- 4 spaces instead of tabs by default
vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Set no swap file
vim.opt.swapfile = false

-- Line numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse mode
vim.opt.mouse = 'a'

-- Don't show mode (in status line)
vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn on by default (to always have space for signs on the left, I think)
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time; displays which-key popup sooner
vim.opt.timeoutlen = 300

-- How new splits are opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- How neovim will display whitespace chars in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }

-- Preview substitutions live!
vim.opt.inccommand = 'split'

-- Show which line the cursor is on
vim.opt.cursorline  = true

-- Min number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search
vim.opt.hlsearch = true

-- Autosave
vim.opt.autowriteall = true

-- No wrap
vim.opt.wrap = false

-- Indenting settings
vim.opt.tabstop=4
vim.opt.softtabstop=0
vim.opt.expandtab=false
vim.opt.shiftwidth=4