return {
    "alfaix/nvim-zoxide",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- This defines :Z, :Zt (tab cd), and :Zw (window cd)
        define_commands = true,
    }
}
