-- Set leaders first thing
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('plugins')

-- Basic settings
vim.opt.number = true               -- Line numbers
vim.opt.relativenumber = true       -- Relative line numbers
vim.opt.wrap = false                -- No wrapping lines
vim.opt.scrolloff = 10              -- Keep lines above/below cursor
vim.opt.sidescrolloff = 8           -- Keep lines left/right of cursor

-- Indentation settings
vim.opt.tabstop = 4                 -- Tab width
vim.opt.shiftwidth = 0              -- Indent width (use tabstop value)
vim.opt.softtabstop = 0             -- Disable soft tab stops
vim.opt.expandtab = true            -- Spaces instead of tabs
vim.opt.smartindent = true          -- Smart auto-indent (?)
vim.opt.autoindent = true           -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true           -- Case insensitive search
vim.opt.smartcase = true            -- Case sensitive if uppercased
vim.opt.hlsearch = false            -- Don't highlight search results
vim.opt.incsearch = true            -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true        -- Enable 24-bit colors
vim.opt.signcolumn = "yes:1"        -- signcolumn fixed size 
vim.opt.showmatch = true            -- Highlight matching brackets
vim.opt.matchtime = 2               -- How long to show matching bracket
vim.opt.cmdheight = 1               -- Command line height
vim.opt.showmode = false            -- Don't show mode in command line 
vim.opt.pumheight = 10              -- Popup menu height
vim.opt.pumblend = 10               -- Popup menu transparency
vim.opt.winblend = 0                -- Floating window transparency
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2            -- Adjusts concealable chars behavior
vim.opt.confirm = true              -- Prompt save on buffer exit
vim.opt.linebreak = true            -- Wrap lines at convenient places
vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'
vim.opt.list = true
vim.opt.listchars = "tab:│ ,trail:·,nbsp:·"

-- File handling settings
vim.opt.swapfile = false            -- No swap files
vim.opt.undofile = true             -- Persistent undo
vim.opt.undolevels = 10000          -- Undo history length
vim.opt.updatetime = 300            -- Faster completion
vim.opt.autoread = true             -- Auto reload files outside nvim

-- Behavior settings
vim.opt.splitbelow = true           -- New split placed below
vim.opt.splitright = true           -- New split placed to the right
vim.opt.iskeyword:append("-")       -- Treat dash as part of word
-- vim.opt.clipboard = "unnamedplus"    -- Sync with system keyboard

-- Command-line completion
vim.opt.wildmenu = true                 -- Enable tab autocomplete
vim.opt.wildmode = "longest:full,full"  -- Autocomplete tab behavior
vim.opt.wildignore:append({"*.o", "*.obj", "*.jar"})

-- Search settings (grep, find)
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
vim.opt.wildoptions:append('fuzzy') -- fuzzy cmd search
vim.opt.path:append('.', '**')      -- Find recursively

-- Better diffs
vim.opt.diffopt:append("linematch:60")

-- Statusline
vim.opt.statusline = '[%n] %<%F %h%w%m%r%=%-14.(%l,%c%V%) %P'
vim.opt.laststatus = 2              -- Show all status lines




-- Colorscheme
vim.cmd.colorscheme({"catppuccin-mocha"})

-- Experimental notifications
require('vim._core.ui2').enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = {
        targets = 'msg'
    }
})

-- Autocommands

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})

-- Keymaps

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc= "Clear highlight easily"})

-- Terminal keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc= "Easier terminal mode exit"})
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
end)

-- Easier split navigation and control
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
