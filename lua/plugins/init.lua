-- Using lazy.nvim plugin manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Check plugin status with :Lazy

require("lazy").setup({

	require("plugins/toggleterm"),

	require("plugins/colorscheme"),

	require("plugins/autopairs"),

	require("plugins/gitsigns"),

	require("plugins/which-key"),

	require("plugins/telescope"),

	require("plugins/treesitter"),

	require("plugins/mini"),

	require("plugins/oil"),

	require("plugins/mason"),

	require("plugins/lspconfig"),

	require("plugins.blink"),

	require("plugins/conform"),

	require("plugins/render-markdown"),
})
