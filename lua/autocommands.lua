-- AUTOCOMMANDS

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Format on save (requires conform.nvim)
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("format-on-save", { clear = true }),
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- Commandline autocomplete
vim.api.nvim_create_autocmd("CmdlineChanged", {
    group = vim.api.nvim_create_augroup("autofill for find", { clear = true }),
    callback = function()
        local cmdline = vim.fn.getcmdline()
        if string.sub(cmdline, 1, 5) == "find " then
            vim.fn.wildtrigger()
        end
    end,
})
