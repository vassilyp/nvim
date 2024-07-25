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

    -- Commenting for ts/jsx
    require 'custom/plugins/ts-context-commentstring',

    require 'custom/plugins/toggleterm',

    require 'custom/plugins/colorscheme',

    require 'custom/plugins/autopairs',

    require 'custom/plugins/gitsigns',

    require 'custom/plugins/which-key',

    require 'custom/plugins/telescope',

    require 'custom/plugins/treesitter',

    require 'custom/plugins/todo-comments',

    require 'custom/plugins/mini',

    require 'custom/plugins/oil',

    require 'custom/plugins/markdown-preview',

    require 'custom/plugins/lsp',

    require 'custom/plugins/lsp-signature',
})
