local snippets = {
    all = {},
    lua = {
        test = "Hello world!",
    },

    html = {
        tag = "<$1 $2>$0</$1>",
    },
}

-- NOTE: this is only intended to work when used after typing the command.
-- Moving the cursor around first results in weird behavior.
vim.keymap.set("i", "<C-j>", function()
    local filetype = vim.bo.filetype

    -- move cursor back by one to grab the word preceeding the cursor
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    if col > 0 then
        vim.api.nvim_win_set_cursor(0, { row, col - 1 })
    end

    local word = vim.fn.expand("<cword>")

    local snip = (snippets[filetype] or {})[word] or snippets["all"][word]

    if snip then
        vim.cmd("normal! diw")

        -- move cursor back
        vim.api.nvim_win_set_cursor(0, { row, col })

        vim.snippet.expand(snip)
    end
end)
