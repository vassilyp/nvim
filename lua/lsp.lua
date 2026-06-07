-- Command to toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle LSP diagnostics" })

vim.lsp.enable({
    "vtsls",
    "gopls",
    "lua_ls",
})
