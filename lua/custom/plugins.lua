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

    require 'custom/plugins/toggleterm',

    require 'custom/plugins/colorscheme',

    require 'custom/plugins/autopairs',

    require 'custom/plugins/comment',

    require 'custom/plugins/gitsigns',

    require 'custom/plugins/nvim-cmp',

    require 'custom/plugins/which-key',

    require 'custom/plugins/telescope',

    require 'custom/plugins/lspconfig',

    require 'custom/plugins/treesitter',

    require 'custom/plugins/todo-comments',

    require 'custom/plugins/mini',

})