-- Set leaders first thing
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('./plugins')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.confirm = true		-- Prompt save on quit
vim.opt.splitbelow = true 	-- How new files open
vim.opt.ignorecase = true 	-- Ignore capitals
vim.opt.smartcase = true
vim.opt.signcolumn = "yes:1" 	-- signcolumn fixed size 
vim.opt.wrap = false 		-- No wrapping lines
vim.opt.shiftwidth = 4 		-- Indent
vim.opt.textwidth = 80
vim.opt.swapfile = false
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'
vim.opt.statusline = '[%n] %<%F %h%w%m%r%=%-14.(%l,%c%V%) %P'
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.wildoptions:append { 'fuzzy' }	-- fuzzy cmd search
vim.opt.path:append {'.', '**'}		-- find recursively

vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'

vim.opt.scrolloff = 10

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})


vim.cmd.colorscheme('catppuccin') -- Colorscheme

-- Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc= "Clear highlight easily"})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc= "Easier terminal mode exit"})
vim.keymap.set("n", "<leader>st", function() 
    vim.cmd.vnew()
    vim.cmd.term()
end)

-- vim.api.nvim_create_user_command('TermHl', function()
--   vim.fn.jobstart({ 'term': 'v:true' })
-- end, { desc = 'Highlights ANSI termcodes in curbuf' })

-- Easier split navigation and control
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
