local state = {
    floating = {
        buf = -1,
        win = -1,
    },
    side = {
        buf = -1,
        win = -1,
    },
}

-- Opens a vertical split with a new or already existing scratch buffer.
local function open_side_window(opts)
    opts = opts or {}

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win = vim.api.nvim_open_win(buf, true, { split = "right", win = 0 })

    return { win = win, buf = buf }
end

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
local function toggle_terminal(opts)
    local win = nil
    local buf = nil

    if opts.floating then
        win = state.floating.win
    else
        win = state.side.win
    end

    if not vim.api.nvim_win_is_valid(win) then
        if opts.floating then
            state.floating = open_floating_window({ buf = state.floating.buf })
        else
            state.side = open_side_window({ buf = state.side.buf })
        end

        if opts.floating then
            buf = state.floating.buf
        else
            buf = state.side.buf
        end

        if vim.bo[buf].buftype ~= "terminal" then
            -- ensure we switch to correct window
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(win)
    end
end

-- Create :Floaterminal command
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, { desc = "Toggles floating terminal buffer" })

-- Floaterminal keymap
vim.keymap.set("n", "<leader>t", "<cmd>Floaterminal<cr>", { desc = "See Terminal", noremap = true })

-- Start terminal in insert
-- vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
--     pattern = { "*" },
--     callback = function()
--         if vim.opt.buftype:get() == "terminal" then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
