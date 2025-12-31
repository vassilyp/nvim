return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            spec = {
                { "<leader>s", desc = "Search" },
                { "<leader>i", desc = "Insert" },
                { "<leader>h", desc = "Git hunk" },
                { "<leader>c", desc = "Code" }
            }
        },
        keys = {
        },
    } }
