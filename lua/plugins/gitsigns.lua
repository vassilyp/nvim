return {
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
                map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git preview hunk" })
                map("n", "<leader>hb", gitsigns.toggle_current_line_blame, { desc = "Git toggle line blame" })
            end,
        },
    },
}
