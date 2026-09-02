-- Automatically previews files when hovered in qf list
-- vim.api.nvim_create_autocmd("CursorMoved", {
--     buffer = 0,
--     callback = function()
--         local qf_window = vim.api.nvim_get_current_win()
--         local line_number = vim.fn.line(".")
--         vim.cmd(line_number .. "cc")
--         vim.cmd("normal! zz")
--         vim.api.nvim_set_current_win(qf_window)
--     end,
-- })

local buf = vim.api.nvim_get_current_buf()

local function preview_entry()
    local qf_window = vim.api.nvim_get_current_win()
    local line_number = vim.fn.line(".")
    vim.cmd(line_number .. "cc")
    vim.cmd("normal! zz")
    vim.api.nvim_set_current_win(qf_window)
end

-- vim.keymap.set("n", "<CR>", preview_entry, { buffer = buf, desc = "Preview quickfix entry" })
