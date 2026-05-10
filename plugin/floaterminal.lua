local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

-- Opens a window with a scratch buffer, or re-opens the window to
-- an already existing scratch buffer
local function open_floating_window(opts)
    opts = opts or {}

    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local window_opts = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win = vim.api.nvim_open_win(buf, true, window_opts)

    return { win = win, buf = buf }
end

-- Toggles a floating window to a terminal buffer: either re-opens
-- a previous window, or creates a new buffer if none exist.
local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = open_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

-- Start terminal in insert mode
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("terminal", { clear = true }),
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "terminal" then
            vim.cmd('startinsert')
        end
    end,
})

-- Create :Floaterminal command
vim.api.nvim_create_user_command("Floaterminal",
    toggle_terminal,
    { desc="Toggles floating terminal buffer" }
)

-- Floaterminal keymap
vim.keymap.set("n", "<leader>st",
    toggle_terminal,
    { desc="See Terminal", noremap=true }
)
