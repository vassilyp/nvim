vim.pack.add { 
    -- Minimal
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/neovim/nvim-lspconfig',

    -- Extra-ish
    'https://github.com/catppuccin/nvim',	-- colorschemes
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/brenoprata10/nvim-highlight-colors',  -- might not need
}

vim.cmd.packadd('nvim.undotree')

-- Configuration

-- oil.nvim
require('oil').setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nvim-highlight-colors
require('nvim-highlight-colors').setup({
    render = 'virtual',
    virtual_symbol_position = 'eol'
})
