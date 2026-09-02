-- KEYMAPS (except for plugin-specific keymaps)

--  Highlight behavior
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight easily" })

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easier ':' press
vim.keymap.set("n", "<leader>;", ":", { desc = "Shortcut to press colon (:)" })

-- Better terminal exit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Easier terminal mode exit" })

-- Move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text up with J" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text down with K" })

-- Better J command
vim.keymap.set("n", "J", "mzJ`z", { desc = "Staple lines together" })

-- Better half-page-scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll a half-page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll a half-page up" })

-- Keep search result in middle when going to next/prev
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev" })

-- Keep paste buffer the same when pasting over highlighted text
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selected text" })

-- How to copy/paste using system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selected text to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Cut into system clipboard" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Cut selected text into system clipboard" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>ld", "<cmd>DiagnosticsToggle<cr>", { desc = "Toggle diagnostics" })
vim.keymap.set(
    "n",
    "<leader>e",
    "<cmd>lua vim.diagnostic.open_float()<cr>",
    { desc = "Open diagnostic floating window" }
)

-- LSP go to definition
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr> zz", { desc = "Go to definition" })

-- Grep shortcut (use ]q or [q to navigate)
vim.keymap.set("n", "<leader>g", function()
    if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
        vim.cmd("cclose")
        return
    end
    vim.cmd("silent grep! " .. vim.fn.input("Grep > "))
    vim.cmd("copen")
end)

-- Find shortcut
vim.keymap.set("n", "<leader>f", ":find ", { desc = "Find shortcut" })
