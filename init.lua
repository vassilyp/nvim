vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- PLUGIN CONFIGURATION

vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/stevearc/oil.nvim',

    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',

    'https://github.com/lewis6991/gitsigns.nvim',

    'https://github.com/neanias/everforest-nvim',
    'https://github.com/brenoprata10/nvim-highlight-colors',
}
vim.cmd.packadd('nvim.undotree')

-- oil.nvim
require('oil').setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nvim-highlight-colors
require('nvim-highlight-colors').setup({
    render = 'virtual',
    virtual_symbol_position = 'eol'
})

-- Telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope search files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope search by grep' })

-- Gitsigns.nvim
local gitsigns = require('gitsigns')
gitsigns.setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    }
})
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
vim.keymap.set("n", "<leader>hb", gitsigns.toggle_current_line_blame, { desc = "Git toggle line blame" })

-- TODO: add conform.nvim

-- OPTIONS

-- Basic settings
vim.opt.number = true               -- Line numbers
vim.opt.relativenumber = true       -- Relative line numbers
vim.opt.wrap = false                -- No wrapping lines
vim.opt.scrolloff = 10              -- Keep lines above/below cursor
vim.opt.sidescrolloff = 8           -- Keep lines left/right of cursor

-- Indentation settings
vim.opt.tabstop = 4                 -- Tab width
vim.opt.softtabstop = 4             -- Disable soft tab stops
vim.opt.shiftwidth = 0              -- Indent width (use tabstop value)
vim.opt.expandtab = true            -- Spaces instead of tabs
vim.opt.smartindent = true          -- Smart auto-indent

-- Search settings
vim.opt.ignorecase = true           -- Case insensitive search
vim.opt.smartcase = true            -- Case sensitive if uppercased
vim.opt.hlsearch = false            -- Don't highlight search results
vim.opt.incsearch = true            -- Show matches as you type

-- Colorscheme
vim.cmd.colorscheme({"everforest"})
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

-- Visual settings
vim.opt.termguicolors = true        -- Enable 24-bit colors
vim.opt.signcolumn = "yes:1"        -- signcolumn fixed size 
vim.opt.showmatch = true            -- Highlight matching brackets
vim.opt.matchtime = 2               -- How long to show matching bracket
vim.opt.showmode = true             -- Show mode in command line
vim.opt.pumheight = 10              -- Popup menu height
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2            -- Adjusts concealable chars behavior
vim.opt.confirm = true              -- Prompt save on buffer exit
vim.opt.linebreak = true            -- Wrap lines at convenient places
vim.opt.winborder = 'rounded'       -- Window border styling
vim.opt.pumborder = 'rounded'       -- Popup window border styling
vim.opt.list = true                 -- Characters for different whitespace
vim.opt.listchars = "tab:│ ,trail:·,nbsp:·"

-- File handling settings
vim.opt.swapfile = false            -- No swap files
vim.opt.undofile = true             -- Persistent undo
vim.opt.undolevels = 10000          -- Undo history length
vim.opt.autoread = true             -- Auto reload files outside nvim

-- Behavior settings
vim.opt.updatetime = 300            -- Faster completion
vim.opt.splitbelow = true           -- New split placed below
vim.opt.splitright = true           -- New split placed to the right
vim.opt.iskeyword:append("-")       -- Treat dash as part of word

-- Search settings (grep, find) (idk if I'm even using this)
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
vim.opt.wildoptions:append('fuzzy') -- fuzzy cmd search
vim.opt.path:append{'**'}      -- Find recursively

-- Better diffs (align changes up to 60 line hunks)
vim.opt.diffopt:append("linematch:60")

-- Statusline
vim.opt.statusline = '[%n] %<%F %h%w%m%r%=%-14.(%l,%c%V%) %P'

-- Notifications
require('vim._core.ui2').enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = {
        targets = 'msg'
    }
})

-- KEYMAPS

--  Highlight behavior
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc= "Clear highlight easily"})

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Better terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc= "Easier terminal mode exit"})

-- Move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text up with J" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text down with K" })

-- Better J command
vim.keymap.set("n", "J", "mzJ`z", { desc = "Staple lines together" })

-- Better half-page-scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll a half-page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll a half-page up" })

-- Keep search result in middle when going to next/prev
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev" })

-- Keep paste buffer the same when pasting over highlighted text
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selected text" })

-- How to copy/paste using system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selected text to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Cut into system clipboard" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Cut selected text into system clipboard" })

-- AUTOCOMMANDS

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.hl.on_yank() end,
})
