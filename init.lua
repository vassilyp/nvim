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

vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'


vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})


vim.cmd.colorscheme('catppuccin') -- Colorscheme

-- LSP
vim.lsp.enable('basedpyright')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
	local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
	if client:supports_method('textDocument/completion') then
	    vim.o.complete = 'o,.,w,b,u'
	    vim.o.completeopt = 'menu,menuone,popup,noinsert'
	    vim.lsp.completion.enable(true, client.id, args.buf)
	end
    end
})

-- Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") 	-- Clear highlight easily
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")		-- Easy terminal mode exit
vim.keymap.set("n", "<CTRL-\\", "<cmd>term<CR>")	-- Open terminal

vim.keymap.set("n", "[d", vim.diagnostic.get_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.get_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Quickfix list" })

-- Easier split navigation and control
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
