-- OPTIONS

-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false -- No wrapping lines
vim.opt.scrolloff = 10 -- Keep lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep lines left/right of cursor

-- Indentation settings
vim.opt.tabstop = 4 -- Tab width
vim.opt.softtabstop = 4 -- Disable soft tab stops
vim.opt.shiftwidth = 0 -- Indent width (use tabstop value)
vim.opt.expandtab = true -- Spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indent

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercased
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Colorscheme
vim.cmd.colorscheme({ "everforest" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes:1" -- signcolumn fixed size
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.showmode = true -- Show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2 -- Adjusts concealable chars behavior
vim.opt.confirm = true -- Prompt save on buffer exit
vim.opt.linebreak = true -- Wrap lines at convenient places
vim.opt.winborder = "rounded" -- Window border styling
vim.opt.pumborder = "rounded" -- Popup window border styling
vim.opt.list = true -- Characters for different whitespace
vim.opt.listchars = "tab:│ ,trail:·,nbsp:·"

-- File handling settings
vim.opt.swapfile = false -- No swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undolevels = 10000 -- Undo history length
vim.opt.autoread = true -- Auto reload files outside nvim

-- Behavior settings
vim.opt.updatetime = 300 -- Faster completion
vim.opt.splitbelow = true -- New split placed below
vim.opt.splitright = true -- New split placed to the right
vim.opt.iskeyword:append("-") -- Treat dash as part of word

-- Search settings (grep, find) (idk if I'm even using this)
vim.opt.grepprg = "rg --vimgrep --no-messages --smart-case"
vim.opt.wildoptions:append("fuzzy") -- fuzzy cmd search
vim.opt.path:append({ "**" }) -- Find recursively

-- Better diffs (align changes up to 60 line hunks)
vim.opt.diffopt:append("linematch:60")

-- Statusline
vim.opt.statusline = "[%n] %<%F %h%w%m%r%=%-14.(%l,%c%V%) %P"

-- Notifications
require("vim._core.ui2").enable({
    enable = true, -- Whether to enable or disable the UI.
    msg = {
        targets = "msg",
    },
})
