-- PLUGIN CONFIGURATION

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/stevearc/oil.nvim",

    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",

    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/nvim-mini/mini.surround",

    "https://github.com/stevearc/conform.nvim",

    "https://github.com/neanias/everforest-nvim",
    "https://github.com/brenoprata10/nvim-highlight-colors",
})
vim.cmd.packadd("nvim.undotree")

-- oil.nvim
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nvim-highlight-colors
require("nvim-highlight-colors").setup({
    render = "virtual",
    virtual_symbol_position = "eol",
})

-- Telescope.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope search files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope search by grep" })

-- Gitsigns.nvim
local gitsigns = require("gitsigns")
gitsigns.setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git Hunk Reset " })
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git Hunk Preview " })
vim.keymap.set("n", "<leader>hb", gitsigns.toggle_current_line_blame, { desc = "Git blame toggle" })

-- mini.surround
require("mini.surround").setup()

-- conform.nvim
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        go = { "gofmt" },
        c = { "clang-format" },
    },
})
