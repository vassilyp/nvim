return {
	-- Colorscheme
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.cmd.colorscheme("onedark")
	-- 	end,
	-- },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				vim.cmd.colorscheme("everforest"),
			})
		end,
	},
}
