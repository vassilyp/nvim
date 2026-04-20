
vim.pack.add { 
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/stevearc/oil.nvim',

    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/stevearc/dressing.nvim',	-- for mason

    'https://github.com/catppuccin/nvim',	-- colorschemes

    'https://github.com/brenoprata10/nvim-highlight-colors',  -- might not need
}
vim.cmd.packadd('nvim.undotree')

require('oil').setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require('nvim-highlight-colors').setup({
    render = 'virtual',
    virtual_symbol_position = 'eol'
})

require("mason").setup({})


