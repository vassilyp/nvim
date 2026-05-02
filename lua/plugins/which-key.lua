return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			spec = {
				{ "<leader>s", desc = "Search" },
				{ "<leader>h", desc = "Git hunk" },
			},
		},
		keys = {},
	},
}
